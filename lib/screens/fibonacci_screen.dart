import 'package:flutter/material.dart';

class FibonacciScreen extends StatefulWidget {
  FibonacciScreen({Key? key}) : super(key: key);

  @override
  State<FibonacciScreen> createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: const Text("Hola como estan"),
    ));
  }
}
