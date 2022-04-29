import 'package:bytebank/components/container.dart';
import 'package:bytebank/components/localization/i18n_container.dart';
import 'package:bytebank/components/localization/i18n_messages.dart';
import 'package:bytebank/models/name.dart';
import 'package:bytebank/screens/dashboard/dashboard_i18n.dart';
import 'package:bytebank/screens/dashboard/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NameCubit("Débora"),
      child: I18NLoadingContainer(
        viewKey: "dashboard",
        creator: (I18NMessages messages) =>
            DashboardView(DashboardViewLazyI18N(messages)),
      ),
    );
  }
}
