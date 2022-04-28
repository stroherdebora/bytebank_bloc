// localization e internationalization

import 'dart:async';

import 'package:bytebank/components/container.dart';
import 'package:bytebank/components/error.dart';
import 'package:bytebank/components/progress.dart';
import 'package:bytebank/http/webclients/i18nWebClient.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';

class LocalizationContainer extends BlocContainer {
  final Widget? child;

  LocalizationContainer({@required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrentLocaleCubit>(
      create: (_) => CurrentLocaleCubit(),
      child: this.child,
    );
  }
}

class CurrentLocaleCubit extends Cubit<String> {
  CurrentLocaleCubit() : super("pt-br");
}

class ViewI18N {
  String? _language;

  ViewI18N(BuildContext context) {
    // o problema dessa abordagem
    // é o rebuild quando voce troca a lingua
    // o que vc quer reconstruir quando trocar o currentlocalecubit?
    this._language = BlocProvider.of<CurrentLocaleCubit>(context).state;
  }

  String? localize(Map<String, String> values) {
    assert(values.containsKey(_language));
    return values[_language];
  }
}

@immutable
abstract class I18nMessagesState {
  const I18nMessagesState();
}

@immutable
class LoadingI18nMessagesState extends I18nMessagesState {
  const LoadingI18nMessagesState();
}

@immutable
class InitI18nMessagesState extends I18nMessagesState {
  const InitI18nMessagesState();
}

@immutable
class LoadedI18nMessagesState extends I18nMessagesState {
  final I18NMessages _messages;

  LoadedI18nMessagesState(this._messages);
}

class I18NMessages {
  final Map<String, dynamic> _messages;

  I18NMessages(this._messages);

  String? get(String key) {
    assert(_messages.containsKey(key));
    return _messages[key];
  }
}

@immutable
class FatalErrorI18nMessagesState extends I18nMessagesState {
  const FatalErrorI18nMessagesState();
}

typedef Widget I18NWidgetCreator(I18NMessages messages);

class I18NLoadingContainer extends BlocContainer {
  I18NWidgetCreator? creator;
  String? viewKey;

  I18NLoadingContainer({
    required I18NWidgetCreator creator,
    required String viewKey,
  }) {
    this.creator = creator;
    this.viewKey = viewKey;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<I18NMessagesCubit>(
      create: (BuildContext context) {
        final cubit = I18NMessagesCubit(this.viewKey!);
        cubit.reload(I18NWebClient(this.viewKey!));
        return cubit;
      },
      child: I18NLoadingView(this.creator!),
    );
  }
}

class I18NLoadingView extends StatelessWidget {
  final I18NWidgetCreator _creator;

  I18NLoadingView(this._creator);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<I18NMessagesCubit, I18nMessagesState>(
      builder: (context, state) {
        if (state is InitI18nMessagesState || state is LoadingI18nMessagesState) {
          return ProgressView(message: "Loading...");
        }

        if (state is LoadedI18nMessagesState) {
          final messages = state._messages;
          return _creator.call(messages);
        }

        return ErrorView("Erro buscando mensagens da tela");
      },
    );
  }
}

class I18NMessagesCubit extends Cubit<I18nMessagesState> {
  final LocalStorage storage = new LocalStorage('local unsecure version_1.json');

  final String _viewKey;

  I18NMessagesCubit(this._viewKey) : super(InitI18nMessagesState());

  reload(I18NWebClient client) async {
    emit(LoadingI18nMessagesState());
    await storage.ready;
    final items = storage.getItem(_viewKey);
    print("Loaded $_viewKey $items");
    if (items != null) {
      emit(LoadedI18nMessagesState(I18NMessages(items)));
      return;
    }
    client.findAll().then(saveAndRefresh);
  }

  saveAndRefresh(Map<String, dynamic> messages) {
    storage.setItem(_viewKey, messages);
    print("saving $_viewKey $messages");
    emit(LoadedI18nMessagesState(I18NMessages(messages)));
  }
}
