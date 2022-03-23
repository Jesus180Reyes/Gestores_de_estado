import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_app/models/usuario.dart';
import 'package:singleton_app/providers/usuarios_services.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService =
        Provider.of<UsuariosServices>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: (usuarioService.existeUsuario)
            ? Text(usuarioService.usuario.nombre)
            : const Text('No hay usuario seleccionado'),
      ),
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
                usuarioService.usuario = newUser;
                Navigator.pop(context);
              },
              child: const Text(
                'Establecer usuario',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
            MaterialButton(
              onPressed: () async {
                await usuarioService.cambiarEdad(50);
                Navigator.pop(context);
              },
              child: const Text(
                'Cambiar edad',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
            MaterialButton(
              onPressed: () {},
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
