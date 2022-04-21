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
  CurrentLocaleCubit() : super('pt_br');
}

class ViewI18N {
  String? _language;

  ViewI18N(BuildContext context) {
    // o problema dessa abordagem
    // é o rebuild quando você troca a língua
    // o que vc quer reconstruir quando trocar o currentlocalecubit?
    // em geral é comum reinicializar o sistema ou voltar para a tela inicial
    this._language = BlocProvider.of<CurrentLocaleCubit>(context).state;
  }

  String? localize(Map<String, String> values) {
    return values[_language];
  }
}
