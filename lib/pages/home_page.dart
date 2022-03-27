import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_app/controllers/usuario_controller.dart';
import 'package:singleton_app/models/usuario.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(
          '/',
          arguments: {
            'nombre': 'Fernando',
            'edad': 30,
          },
        ),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Obx(
        () => usuarioCtrl.existeUsuario.value
            ? InformacionUsuario(
                usuario: usuarioCtrl.usuario.value,
              )
            : const NoInfo(),
      ),
    );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No hay información'));
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
      padding: const EdgeInsets.all(20),
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
          const ListTile(
            title: Text(
              'Nombre',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text(
              'Edad: ${usuario.edad}',
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
          ...usuario.profesiones!
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
