int total = 0;

void main() {
  func1();
  func2("hello");
  func3("hello", "world !");
  func4("hello",middle:"Sir", last:"Kevin !");
  var arr = [1,2,3,4,5];
  func5(arr);
  var recur = func6(256);
  print('recurisve 256 round: $total');
  parser1('Hello, this is lambda function');
  print('This is parser of 25: ${parser2(25)}');
}

// void function
void func1() {
  print('this is a void function');

}
// void function with parameter
void func2(String text) {
  print('this is a func with param : $text');
}
// void function with optional param positional
void func3(String first, [last]) {
  print('this is func with optional param: $first  $last');
}
// void function with optional param name
void func4(String first, {middle, last}) {
  print('this is func with optional name: $first $middle $last');
}
// function with return
func5(List args) {
  args.forEach((v)=>{print('item have value $v')});
  return 0;
}
// recursive function

func6(int max) {
  if(max > 0){
    total += 1;
    func6(max-1);
  } else {
    return total;
  }
}
// lambda function
void parser1(String input) => { print('Input is : $input') };
int parser2(int input) => input*input;
