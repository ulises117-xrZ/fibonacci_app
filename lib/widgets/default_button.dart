import 'package:flutter/material.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.grey,
          elevation: 7,
        ),
        onPressed: onPressed,
        child: Text(
          "$text",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
