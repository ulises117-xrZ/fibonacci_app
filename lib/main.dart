import 'package:flutter/material.dart';
import 'package:prueba_fibonacci/screens/fibonacci_screen.dart';
import 'package:prueba_fibonacci/theme/theme_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Matriz de fibonacci',
      theme: TemaApp(),
      home: FibonacciScreen(),
    );
  }
}
