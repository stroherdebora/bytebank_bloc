import 'package:bytebank/components/localization/eager_localization.dart';
import 'package:bytebank/components/localization/i18n_messages.dart';
import 'package:flutter/material.dart';

class DashboardViewLazyI18N {
  final I18NMessages _messages;

  DashboardViewLazyI18N(this._messages);

  String? get transfer => _messages.get("transfer");

  String? get transactionFeed => _messages.get("transaction_feed");

  String? get changeName => _messages.get("change_name");
}

class DashboardViewI18N extends ViewI18N {
  DashboardViewI18N(BuildContext context) : super(context);

  String? get transfer =>
      localize({"pt-br": "Transferir", "en-us": "Transfer"});

  String? get transactionFeed =>
      localize({"pt-br": "Transações", "en-us": "Transaction Feed"});

  String? get changeName =>
      localize({"pt-br": "Mudar Nome", "en-us": "Change Name"});
}
