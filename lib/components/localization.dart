// localization e internationalization

import 'package:bytebank/components/container.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/default.i18n.dart';

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
    return values[_language];
  }
}
