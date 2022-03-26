import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/user_bloc.dart';
import 'package:singleton_app/models/usuario.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/'),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false)
                  .add(DeleteUser());
            },
          ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.existeUsuario
              ? InformacionUsuario(
                  usuario: state.usuario!,
                )
              : const Center(child: Text('No hay usuario Registrado'));
        },
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
          ...usuario.profesiones
              .map((profesion) => ListTile(
                    title: Text(profesion),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
