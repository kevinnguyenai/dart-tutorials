import 'lib.dart' as libMath;

void main() {
   var num1 = 10; 
   var num2 = 20; 
   var sum = libMath.add(num1,num2); 
   var mod = libMath.modulus(num1,num2); 
   var r = libMath.random(10);  
   
   print("$num1 + $num2 = $sum"); 
   print("$num1 % $num2= $mod"); 
   print("random no $r"); 
} 
