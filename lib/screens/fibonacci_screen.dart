import 'package:flutter/material.dart';
import 'package:prueba_fibonacci/state/state.dart';
import 'package:prueba_fibonacci/utils/fibonacci_generator.dart';
import 'package:prueba_fibonacci/widgets/array_widget.dart';
import 'package:prueba_fibonacci/widgets/default_button.dart';
import 'package:prueba_fibonacci/widgets/dialog_widget.dart';
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

  void generarMatriz() {
    if (initialValueController.text.isEmpty ||
        latestValueController.text.isEmpty) {
      AppDialogos().alertaPrimaria(context, "Error", "Debes escoger 2 numeros");
      limpiarMatriz();
      return;
    }
    if (int.parse(latestValueController.value.text) <
        int.parse(initialValueController.value.text)) {
      AppDialogos().alertaPrimaria(
          context, "Error", "El elemento final debe ser mayor al inicial");
      limpiarMatriz();
      return;
    }
    ;
    List<int> localFibonacci =
        generarFibonacci(int.parse(latestValueController.value.text));
    print(localFibonacci);
    List<int> subListFib =
        localFibonacci.sublist(int.parse(initialValueController.value.text));
    if (subListFib.length < 9) {
      print("es menor");
      for (int i = 0; i < 9; i++) {
        int local = subListFib.length;
        if (i == local) {
          subListFib.insert(0, 0);
        }
      }
      print(subListFib);
      listaFibonacci.value = subListFib;
      sumaMatriz.value = listaFibonacci.value.reduce((a, b) => a + b);
      handleEnableButtons();
    } else {
      if (subListFib.length > 9) {
        AppDialogos().alertaPrimaria(context, "ha ocurrido un error",
            "El rango es superior a la matriz intenta con otros numeros");
        limpiarMatriz();
      } else {
        listaFibonacci.value = subListFib;
        sumaMatriz.value = listaFibonacci.value.reduce((a, b) => a + b);
        handleEnableButtons();
      }
    }
    print(listaFibonacci.value);
  }

  void handleDisableButtons() => buttonsActives.value = false;
  void handleEnableButtons() => buttonsActives.value = true;
  void handleCleanMatriz() =>
      listaFibonacci.value = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  void limpiarMatriz() {
    handleDisableButtons();
    handleCleanMatriz();
    sumaMatriz.value = 0;
  }

  void rotarMatriz() {
    List<int> parte1 = listaFibonacci.value.sublist(0, 3);
    List<int> parte2 = listaFibonacci.value.sublist(3, 6);
    List<int> parte3 = listaFibonacci.value.sublist(6, 9);
    List<int> objRotado = [];
    for (int i = 0; i < 3; i++) {
      objRotado.addAll([parte3[i], parte2[i], parte1[i]]);
    }
    listaFibonacci.value = objRotado;
  }

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
          child: ListView(children: [
            Column(
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
                      initialValueController: latestValueController,
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
                        generarMatriz();
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
                            onPressed:
                                buttonsActives.value ? rotarMatriz : null,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultButtonWidget(
                            text: "Limpiar Matriz",
                            onPressed:
                                buttonsActives.value ? limpiarMatriz : null,
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
          ]),
        ));
  }
}
