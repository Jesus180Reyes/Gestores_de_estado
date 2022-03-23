import 'package:flutter/material.dart';
import 'package:singleton_app/models/usuario.dart';

class UsuariosServices with ChangeNotifier {
  Usuario? _usuario;
  Usuario get usuario => _usuario!;
  bool get existeUsuario => (_usuario != null) ? true : false;

  set usuario(Usuario user) {
    _usuario = user;
    notifyListeners();
  }

  Future cambiarEdad(int edad) async {
    _usuario!.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    _usuario = null;
    notifyListeners();
  }
}
