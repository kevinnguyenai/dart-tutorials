void main() {
  print('------single interface-----');
  B pt = new B();
  pt.printer();
  print('-----multiple interface-----');
  ImplC ic = new ImplC();
  ic.printerA();
  ic.printerB();

}

class A {
  printer() {}
}

class B implements A {
  printer() {
    print('-----------Class B---------------');
  }
}

class ImplA {
  printerA(){}
}

class ImplB {
  printerB(){}
}

class ImplC implements ImplA, ImplB {
  printerA() {
    print('----------Impl of A--------------');
  }

  printerB() {
    print('----------Impl of B--------------');
  }
}