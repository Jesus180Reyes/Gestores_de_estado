import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/usuarios/usuario_cubit.dart';
import 'package:singleton_app/models/usuario.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final newUser = Usuario(
                  edad: 32,
                  nombre: 'Fernando Herrera',
                  profesiones: ['Desarrollador', 'Diseñador'],
                );
                usuarioCubit.seleccionarUsuario(newUser);
                Navigator.pop(context);
              },
              child: const Text(
                'Establecer usuario',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
            MaterialButton(
              onPressed: () {
                usuarioCubit.cambiarEdad(30);
                Navigator.pop(context);
              },
              child: const Text(
                'Cambiar edad',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
            MaterialButton(
              onPressed: () {
                usuarioCubit.agregarProfesion('Desarrollador Flutter');
                Navigator.pop(context);
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
