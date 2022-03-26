import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:singleton_app/models/usuario.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {
      emit(UserSetState(event.user));
    });
    on<DeleteUser>((event, emit) {
      emit(const UserInitialState());
    });
    on<ChangeUserAge>((event, emit) {
      if (!state.existeUsuario) return;
      emit(UserSetState(state.usuario!.copyWith(edad: event.age)));
    });
    on<AddProfesion>((event, emit) {
      if (!state.existeUsuario) return;
      final professions = [...state.usuario!.profesiones, event.profesion];
      emit(UserSetState(state.usuario!.copyWith(profesiones: professions)));
    });
  }
}
