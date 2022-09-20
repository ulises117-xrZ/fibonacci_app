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
      debugShowCheckedModeBanner: false,
      title: 'Matriz de fibonacci',
      theme: TemaApp(),
      home: FibonacciScreen(),
    );
  }

  //theme

  ThemeData TemaApp() {
    return ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color.fromRGBO(
              103,
              200,
              255,
              1,
            ),
            secondary: Color.fromARGB(255, 88, 88, 88)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18));
            }),
            // backgroundColor: MaterialStateProperty.all<Color>(
            //   const Color.fromRGBO(
            //     103,
            //     200,
            //     255,
            //     1,
            //   ),
            // ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.zero,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 39, 39, 39),
          )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            width: 2,
            color: Color.fromARGB(255, 136, 136, 136),
          )),
        ));
  }
}
