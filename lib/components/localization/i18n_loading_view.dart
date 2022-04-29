import 'package:bytebank/components/error_view.dart';
import 'package:bytebank/components/localization/i18n_cubit.dart';
import 'package:bytebank/components/localization/i18n_messages.dart';
import 'package:bytebank/components/localization/i18n_state.dart';
import 'package:bytebank/components/progress/progress_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef Widget I18NWidgetCreator(I18NMessages messages);

class I18NLoadingView extends StatelessWidget {
  final I18NWidgetCreator _creator;

  I18NLoadingView(this._creator);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<I18NMessagesCubit, I18nMessagesState>(
      builder: (context, state) {
        if (state is InitI18nMessagesState ||
            state is LoadingI18nMessagesState) {
          return ProgressView(message: "Loading...");
        }

        if (state is LoadedI18nMessagesState) {
          final messages = state.messages;
          return _creator.call(messages);
        }

        return ErrorView("Erro buscando mensagens da tela");
      },
    );
  }
}
