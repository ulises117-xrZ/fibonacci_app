import 'package:flutter/material.dart';

class ArrayWidget extends StatelessWidget {
  const ArrayWidget({
    Key? key,
    required this.fibonacci,
  }) : super(key: key);

  final List<int> fibonacci;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 110,
            childAspectRatio: 3 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: fibonacci.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              '${fibonacci[index]}',
              style: const TextStyle(color: Colors.black),
            ),
          );
        });
  }
}
