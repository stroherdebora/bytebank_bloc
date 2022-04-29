import 'package:bytebank/components/localization/i18n_messages.dart';
import 'package:flutter/widgets.dart';

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
  final I18NMessages messages;

  LoadedI18nMessagesState(this.messages);
}

@immutable
class FatalErrorI18nMessagesState extends I18nMessagesState {
  const FatalErrorI18nMessagesState();
}
