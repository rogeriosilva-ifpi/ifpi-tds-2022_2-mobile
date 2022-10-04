import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tools'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('Calculate BMI'),
              onPressed: () {
                Navigator.pushNamed(context, '/bmi');
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/fuel');
              },
              child: const Text('Fuel App'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: const Text('List App'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/animals');
              },
              child: const Text('Animals List'),
            )
          ],
        ),
      ),
    );
  }
}
