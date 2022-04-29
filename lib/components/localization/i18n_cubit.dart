import 'package:bytebank/components/localization/i18n_messages.dart';
import 'package:bytebank/components/localization/i18n_state.dart';
import 'package:bytebank/http/webclients/i18nWebClient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';

class I18NMessagesCubit extends Cubit<I18nMessagesState> {
  final LocalStorage storage =
      new LocalStorage('Local unsecure version_1.json');
  final String _viewKey;

  I18NMessagesCubit(this._viewKey) : super(InitI18nMessagesState());

  reload(I18NWebClient client) async {
    emit(LoadingI18nMessagesState());
    await storage.ready;
    final items = storage.getItem(_viewKey);
    print('Loaded $_viewKey $items');
    if (items != null) {
      emit(LoadedI18nMessagesState(I18NMessages(items)));
      return;
    }

    client.findAll().then(saveAndRefresh);
  }

  saveAndRefresh(Map<String, dynamic> messages) {
    storage.setItem(_viewKey, messages);
    print('saving $_viewKey $messages');
    final state = LoadedI18nMessagesState(I18NMessages(messages));
    emit(state);
  }
}
