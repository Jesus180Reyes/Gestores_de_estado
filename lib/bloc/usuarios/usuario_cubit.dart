import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/models/usuario.dart';
part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivos(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivos) {
      final user = currentState.usuario;
      user.edad = edad;
      emit(UsuarioActivos(user));
    }
  }

  void agregarProfesion(String profesion) {
    final currentState = state;
    if (currentState is UsuarioActivos) {
      final user = currentState.usuario;
      user.profesiones.add(profesion);
      emit(UsuarioActivos(user));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }
}
