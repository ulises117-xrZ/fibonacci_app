import 'package:flutter/material.dart';

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
