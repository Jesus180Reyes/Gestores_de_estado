part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existeUsuario;
  final Usuario? usuario;

  const UserState({
    this.existeUsuario = false,
    this.usuario,
  });
}

class UserInitialState extends UserState {
  const UserInitialState() : super(existeUsuario: false, usuario: null);
}

class UserSetState extends UserState {
  final Usuario newUser;

  const UserSetState(this.newUser)
      : super(existeUsuario: true, usuario: newUser);
}
