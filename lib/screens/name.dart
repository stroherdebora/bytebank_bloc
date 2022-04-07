import 'package:bytebank/components/container.dart';
import 'package:bytebank/models/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Integra a Cubit e a View
class NameContainer extends BlocContainer {
  @override
  Widget build(BuildContext context) {
    return NameView();
  }
}

// View ouve o Container
// para alterar a informação visual
class NameView extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Agora essa abordagem não tem problema,
    // pois não vamos fazer um rebuild quando o estado é alterado
    _nameController.text = context.read<NameCubit>().state;

    // BlocBuilder<NameCubit, String>(builder: (context, state) {
    //   return Text("$state");
    // });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change name"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: "Desired name"),
            style: TextStyle(fontSize: 24.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  final name = _nameController.text;
                  context.read<NameCubit>().change(name);
                  Navigator.pop(context);
                },
                child: Text("Change"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
