import 'package:bmiapp/pages/animals_page.dart';
import 'package:bmiapp/pages/bmi_page.dart';
import 'package:bmiapp/pages/fuel_page.dart';
import 'package:bmiapp/pages/home_page.dart';
import 'package:bmiapp/pages/list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // home: const BMIPage(title: 'BMI App'),
      initialRoute: '/home',
      routes: {
        '/bmi': (context) => const BMIPage(title: 'BMI App'),
        '/home': (context) => const HomePage(),
        '/fuel': (context) => FuelPage(),
        '/list': (context) => const ListPage(),
        '/animals': (context) => const AnimalsPage(),
      },
    );
  }
}
