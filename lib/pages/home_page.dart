import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_app/models/usuario.dart';
import 'package:singleton_app/providers/usuarios_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuariosServices>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/'),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              usuarioService.removerUsuario();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        title: const Text('Home Page'),
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(
              usuario: usuarioService.usuario,
            )
          : const Center(
              child: Text('No hay usuario seleccionado'),
            ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListTile(
            title: Text(
              'Nombre: ${usuario.nombre}',
            ),
          ),
          const ListTile(
            title: Text('Nombre'),
          ),
          ListTile(
            title: Text(
              'Edad ${usuario.edad} ',
            ),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(title: Text('Profesion 1: ${usuario.profesiones[0]}')),
          ListTile(title: Text('Profesion 1: ${usuario.profesiones[1]}')),
          const ListTile(title: Text('Profesion 1')),
        ],
      ),
    );
  }
}
