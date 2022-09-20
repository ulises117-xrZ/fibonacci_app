import 'package:flutter/material.dart';

class TextWithInputWidget extends StatelessWidget {
  const TextWithInputWidget(
      {Key? key, required this.initialValueController, required this.text})
      : super(key: key);

  final TextEditingController initialValueController;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text("$text:"),
      SizedBox(width: 15),
      SizedBox(
          width: 40,
          child: TextField(
            onChanged: ((value) => print(initialValueController.value.text)),
            controller: initialValueController,
            cursorColor: Colors.black,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                width: 2,
                color: Colors.black,
              )),
              isDense: true,
            ),
          ))
    ]);
  }
}
