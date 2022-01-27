
enum STATUS {
  Init,
  Start,
  Running,
  Stop
}

void main() {
 var nameList = ['Peter', 'Robbin', 'Yeal', 'Alice', 'Joan'];
 for (String i in nameList) {
   print(i);
 }
 print('---------------Number--------------');
 String numStr = '12.5';
 int numberE = 4;
 double numberV = 9.9;
 print(num.parse(numStr));
 print(numberE.isEven);
 print(numberE.isOdd);
 print(numberV.ceil());
 print(numberV.floor());
 print(numberV.truncate());
 print(numberV.toInt());
 print(numberV.round());
 print('---------------string--------------');
 String first = 'Hello';
 String last  = "World !";
 print('Concentrate ' + first + ' ' + last + '\n');
 print('codeUnits: ${first.codeUnits}');
 print('isEmpty: ${first.isEmpty}');
 print('Length: ${first.length}');
 print(' Odd world is here ! '.trim());
 print(' Odd world is here ! '.toLowerCase());
 print(' Odd world is here ! '.toUpperCase());
 print(' Odd world is here ! '.replaceAll('Odd', 'ODD'));
 print(' Odd world is here ! '.split(" "));
 print(' Odd world is here ! '.substring(2,5));
 print(32768.toString());
 print(' Odd world is here ! '.codeUnitAt(12));
 print('--------------List----------------');
 var arr1 = [1,2,3,4,5];
 var arr2 = List.filled(5,0);
 arr1.addAll(arr2);
 print('arr1 after add arr2: ${arr1.toString()}');
 var arr3 = [];
 arr3.addAll([6,7,8,9,10]);
 print('empty arr3 after add more items: ${arr3.toString()}');
 arr3.insert(arr3.length, 11);
 print('arr3 add `11` to the last by `insert`: ${arr3}');
 print('--------------Map------------------');
 var dict1 = {"name": "Kevin", "age": 39};
 var dict2 = new Map();
 print('dict1 value: ${dict1.values}');
 print('dict1 key: ${dict1.keys}');
 print('dict1 all: ${dict1}');
 var dict3 = Map.from(dict1);
 print('dict3 from dict1: ${dict1}');
 var dict4 = {'item1': null, 'item2': 'item2', 'item3': 3};
 print('dict5 is: ${dict4}');
 print('-------------Symbol----------------');
 print('-------------Rune------------------');
 'A string is litteral'.runes.forEach((int rune) {
   var character = new String.fromCharCode(rune);
   print(character);
 });
 Runes inputs = new Runes(' \u{1f605} ');
 print(new String.fromCharCodes(inputs));
 print('------------Enum-------------------');

 STATUS.values.forEach((v) => {print('value $v have index ${v.index}')});
}