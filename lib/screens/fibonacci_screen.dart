import 'package:flutter/material.dart';
import 'package:prueba_fibonacci/state/state.dart';
import 'package:prueba_fibonacci/widgets/array_widget.dart';
import 'package:prueba_fibonacci/widgets/text_with_input_widget.dart';

class FibonacciScreen extends StatefulWidget {
  FibonacciScreen({Key? key}) : super(key: key);

  @override
  State<FibonacciScreen> createState() => _FibonacciScreenState();
}

class _FibonacciScreenState extends State<FibonacciScreen> {
  @override
  void initState() {
    super.initState();
  }

  final List<Map> myProducts =
      List.generate(10, (index) => {"id": index, "name": "Product $index"})
          .toList();

  List<int> fibonacci = [1, 4, 6, 0, 0, 0, 0, 0, 0];
  TextEditingController initialValueController = TextEditingController();
  TextEditingController latestValueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Matriz de Fibonacci",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ValueListenableBuilder(
                valueListenable: listaFibonacci,
                builder: (context, value, child) {
                  return SizedBox(
                    height: 380,
                    child: ArrayWidget(fibonacci: listaFibonacci.value),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: sumaMatriz,
                builder: (context, value, child) {
                  return Text("Suma de matriz: ${sumaMatriz.value}");
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextWithInputWidget(
                    text: "Elemento inicial",
                    initialValueController: initialValueController,
                  ),
                  TextWithInputWidget(
                    text: "Elemento final",
                    initialValueController: initialValueController,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DefaultButtonWidget(
                    text: "Generar matriz",
                    onPressed: () {
                      buttonsActives.value = !buttonsActives.value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ValueListenableBuilder(
                    valueListenable: buttonsActives,
                    builder: (context, value, child) {
                      return Column(children: [
                        DefaultButtonWidget(
                          text: "Rotar a la derecha",
                          onPressed: buttonsActives.value ? () {} : null,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DefaultButtonWidget(
                          text: "Limpiar Matriz",
                          onPressed: buttonsActives.value ? () {} : null,
                        )
                      ]);
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }
}

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
