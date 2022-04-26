// localization e internationalization

import 'package:bytebank/components/container.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
  final I18nMessages _messages;

  LoadedI18nMessagesState(this._messages);

}

class I18nMessages {
  final Map<String, String> _messages;

  I18nMessages(this._messages);

  String? get(String key) {
    assert (_messages.containsKey(key));
    return _messages[key];
  }
}

@immutable
class FatalErrorI18nMessagesState extends I18nMessagesState {

  const FatalErrorI18nMessagesState();

}

class I18NLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<I18NMessagesCubit, I18nMessagesState>(
      builder: (context, state){
        if (state is I18)
      },),(
     
    );
  }
}
