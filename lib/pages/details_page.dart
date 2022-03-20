import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {},
              child: const Text(
                'Establecer usuario',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text(
                'Cambiar edad',
                style: TextStyle(fontSize: 20),
              ),
              color: Colors.blue[100],
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text(
                'anadir profesion',
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
