import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_app/bloc/usuarios/usuario_cubit.dart';
import 'package:singleton_app/helpers/helpers.dart';
import 'package:singleton_app/pages/details_page.dart';
import 'package:singleton_app/pages/home_page.dart';
import 'package:singleton_app/theme/apptheme.dart';

void main() {
  runApp(const MyApp());
  cambiarColorStatus();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UsuarioCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        title: 'Singleton App',
        initialRoute: 'home',
        routes: {
          'home': (context) => const HomePage(),
          '/': (context) => const DetailsPage(),
        },
      ),
    );
  }
}
