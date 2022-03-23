// ignore_for_file: prefer_final_fields

import 'dart:async';

import 'package:singleton_app/models/usuario.dart';

class _UsuarioService {
  Usuario? _usuario;
  StreamController<Usuario> _usuarioStreamController =
      StreamController<Usuario>.broadcast();

  Usuario get usuario => usuario;
  bool get existeUsuario => (_usuario != null) ? true : false;
  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  void cargarUsuario(Usuario user) {
    _usuario = user;
    _usuarioStreamController.add(user);
  }

  void cambiarEdad(int edad) {
    _usuario!.edad = edad;
  }

  dispose() {
    _usuarioStreamController.close();
  }
}

final usuarioService = _UsuarioService();
