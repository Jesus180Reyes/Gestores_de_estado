import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:singleton_app/pages/details_page.dart';
import 'package:singleton_app/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Singleton App',
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        '/': (context) => const DetailsPage(),
      },
      // getPages: [
      //   GetPage(name: 'home', page: () => const HomePage()),
      //   GetPage(name: '/', page: () => const DetailsPage()),
      // ],
    );
  }
}
