import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_app/pages/details_page.dart';
import 'package:singleton_app/pages/home_page.dart';
import 'package:singleton_app/providers/usuarios_services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsuariosServices(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
