import 'package:flutter/material.dart';
import 'package:singleton_app/models/usuario.dart';
import 'package:singleton_app/services/usuario_service.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
                ? Text(snapshot.data!.nombre)
                : const Text('No hay usuario');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                final nuevoUsuario = Usuario(nombre: "Jesus", edad: 20);
                usuarioService.cargarUsuario(nuevoUsuario);
              },
              child: const Text(
                'Establecer usuario',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
            MaterialButton(
              onPressed: () {
                usuarioService.cambiarEdad(30);
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
