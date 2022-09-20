import 'package:flutter/material.dart';
import 'package:prueba_fibonacci/screens/fibonacci_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matriz de fibonacci',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FibonacciScreen(),
    );
  }
}
