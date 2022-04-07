// Gerencia as informações
// Mantém as informações e entrega para
// o Container por meio de um Provider

// O estado é uma única String
// Poderia ser um perfil com diversos valores
import 'package:flutter_bloc/flutter_bloc.dart';

class NameCubit extends Cubit<String> {
  NameCubit(String name) : super(name);
  void change(String name) => emit(name);
}
