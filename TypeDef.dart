typedef ManyOperation(int firstNo, int secondNo);

Add(int firstNo,int second){ 
  print("Add result is ${firstNo+second}"); 
}  
Subtract(int firstNo,int second){ 
  print("Subtract result is ${firstNo-second}"); 
}  
Divide(int firstNo,int second){ 
  print("Divide result is ${firstNo~/second}"); 
}
Multiply(int firstNo, int second) {
  print("Multiply result is ${firstNo*second}");
}

Calculate(int firstNo, int second, ManyOperation oper) {
  print('inside Calculate function');
  oper(firstNo,second);
}
void main() {
  ManyOperation oper;
  oper = Add;
  oper(10,20);
  oper = Subtract;
  oper(20,10);
  oper = Divide;
  oper(100,10);
  oper = Multiply;
  oper(5,5);
  Calculate(25,30,oper);
}