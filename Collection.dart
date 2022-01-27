import "dart:collection";

List arrList = [1,2,3,4,5,5,5,5,5,5];
Map<String,int> map = {'no1': 1, 'no2': 2, 'no3': 3, 'no4': 4, 'no5': 5 };
Set<String> fruits = new Set();
Queue<String> arrFruits = new Queue();

class Entry<T> extends LinkedListEntry<Entry<T>> {
  T value;
  Entry(this.value);
  @override
  String toString() {
    return '$value';
  }
}

void main() {
  //--------------------------- Set Using
  fruits.addAll(["Banana","Apple","StrawBerry"]);
  //-------------------------- Qeue using
  print('----------------------Using Queue');
  arrFruits.addAll(fruits);
  Iterator i = arrFruits.iterator;
  while(i.moveNext()) {
    print(i.current);
    
  }
  //---------------------------- LinkedList using
  print('-----------------------Using LinkedList'); 
  var linkedList = LinkedList<Entry<int>>();
  linkedList.add(Entry(10));
  linkedList.add(Entry(20));
  print('linkedList is : ${linkedList}');
  linkedList.clear();
  print('cleared linkedList is: ${linkedList}');

  //---------------------------- DoubleLinkedQueue;
  /**
   * Deque or Double Ended Queue is a generalized version of Queue data
   * structure that allows insert and delete at both ends.
   */
  print('-----------------------Using DoubleLinkedQueue'); 
  DoubleLinkedQueue dlq1 = new DoubleLinkedQueue();
  dlq1.addAll([1,2,3,4,5]);
  DoubleLinkedQueue dlq2 = DoubleLinkedQueue.from([1,2,3,4,5]);
  DoubleLinkedQueue dlq3 = DoubleLinkedQueue.of(dlq2);
  print('$dlq1');print('$dlq2');print('$dlq3');
  print('first of dlq1 : ${dlq1.first} and last of dlq1: ${dlq1.last}');
}