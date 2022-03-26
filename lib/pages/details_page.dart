import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/user_bloc.dart';
import 'package:singleton_app/models/usuario.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final newUser = Usuario(
                  edad: 30,
                  nombre: 'Fernando Herrera',
                  profesiones: ['Desarrollador', 'Diseñador'],
                );
                userBloc.add(
                  ActivateUser(newUser),
                );
              },
              child: const Text(
                'Establecer usuario',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
            MaterialButton(
              onPressed: () {
                userBloc.add(ChangeUserAge(50));
              },
              child: const Text(
                'Cambiar edad',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
            MaterialButton(
              onPressed: () {
                userBloc.add(AddProfesion('Desarrollador Flutter'));
              },
              child: const Text(
                'anadir profesion',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
          ],
        ),
      ),
    );
  }
}
