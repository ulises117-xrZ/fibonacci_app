List<int> generarFibonacci(int elementoFinal) {
  List<int> generatedList = [];
  int n1 = 0, n2 = 1, n3;
  for (int i = 2; i < elementoFinal; i++) {
    if (i == 2) {
      generatedList.add(0);
    }
    if (i == 2) {
      generatedList.add(1);
    }
    n3 = n1 + n2;
    generatedList.add(n3);
    n1 = n2;
    n2 = n3;
  }
  print('aca $generatedList');
  return generatedList;
}
