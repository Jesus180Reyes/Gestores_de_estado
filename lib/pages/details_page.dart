import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_app/controllers/usuario_controller.dart';
import 'package:singleton_app/models/usuario.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                usuarioCtrl.cargarUsuario(
                  Usuario(
                    edad: 50,
                    nombre: 'Jesus',
                    profesiones: ['Programador', 'Diseñador'],
                  ),
                );
                Get.snackbar('Usuario Agregado', 'Usuario Agregado');
              },
              child: const Text(
                'Establecer usuario',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
            MaterialButton(
              onPressed: () {
                usuarioCtrl.cambiarEdad(25);
              },
              child: const Text(
                'Cambiar edad',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
            MaterialButton(
              onPressed: () {
                usuarioCtrl.agregarProfesion(
                    'Profesion 1: ${usuarioCtrl.usuario.value.profesiones!.length + 1}  ');
              },
              child: const Text(
                'anadir profesion',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
            MaterialButton(
              onPressed: () {
                !Get.isDarkMode
                    ? Get.changeTheme(ThemeData.dark())
                    : Get.changeTheme(ThemeData.light());
              },
              child: const Text(
                'Cambiar Tema',
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
