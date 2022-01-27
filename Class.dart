import "dart:core";

enum StudentData {
  Name,
  Age,
  Depart
}

// class student
class Student {
  //field 
  int maxRecord = 1000;
  var _student,_studentList;
  // Constructor
  Student(Map<StudentData,String> student) {
    this._student = student;
  }
  Student.StudentList(List<Map<StudentData,String>> studentList) {
    this._studentList = studentList;
  }

  // class method
  void printStudent() {
    print('${this._student}');
  }

  void printStudentList() {
    print('${this._studentList}');
  }

}

class CS {
  //field 
  int maxRecord = 1000;
  var _student, _studentList;
  //setter _student
  void set SetStudent(Map<StudentData,String> data) {
    this._student = data;
  }
  void set SetStudentDepart(String depart) {
    this._student[StudentData.Depart] = depart;
  }
  //getter _student
  Map<StudentData,String> get GetStudent {
    return this._student;
  }

  //setter _studentList
  void set SetStudentList(List<Map<StudentData,String>> data) {
    this._studentList = data;
  }
  /**
   * @param indexData is list of 
   * [depart, index] where depart is textstring & index is interger 
   */
  void set SetStudentListIndexDepart(List indexData) {
    if(indexData[1]!=null) {
      this._studentList[indexData[1]][StudentData.Depart] = indexData[0];
    } else {
      this._studentList[0][StudentData.Depart] = indexData[0];
    }
  }

  //getter _studentList
  List<Map<StudentData,String>> get getStudentList {
    return this._studentList;
  }

  // method
  void printStudent() {
    print('${this._student}');
  }

  void printStudentList() {
    print('${this._studentList}');
  }
}

class Animal {
  //attribute
  var _speak;
  var _action;
  static String gen = 'Gaia';
  Animal(voice, actionType) {
    this._speak = voice;
    this._action = actionType;
  }
  static String getGen() {
    return gen;
  }

  void speaking() {}

  void doing() {}
}

class Cat extends Animal {
  // attribute
  var _health;
  var _mana;
  Cat(h, m): super("meo", "jumping") {
    this._health = h;
    this._mana = m;
  }

  // method
  int get getHealth {
    return this._health;
  }
  int get getMana {
    return this._mana;
  }
  void action() {
    print('Cat is ${super._action}');
  }
  void setAction(String action) {
    super._action = action;
  }
  void attack(int point, [obj]) {
    if(obj !=null && obj is Dog) {
      print('Cat attacking $obj hit $point');
      obj._health -= point;
      if(obj._health <= 0) {
        print('$obj is Dead');
      }
    } else {
      print('Cat attacking missing');
    }
  }

  @override
  void speaking() {
    print('Cat speaking ${super._speak}');
  }


}

class Dog extends Animal {
  // attribute
  var _health;
  var _mana;
  Dog(h, m): super("woof", "running") {
    this._health = h;
    this._mana = m;
  }

  // method
  int get getHealth {
    return this._health;
  }
  int get getMana {
    return this._mana;
  }
  void action() {
    print('Dog is ${super._action}');
  }
  void setAction(String action) {
    super._action = action;
  }
  void attack(int point, [obj]) {
    if(obj != null && obj is Cat) {
      print('Dog attacking $obj hit $point');
      obj._health -= point;
      if(obj._health <= 0) {
        print('$obj is Dead');
      } 
    } else {
      print('Dog attacking missing');
    }
  }

  @override
  void speaking() {
    print('Dog speaking ${super._speak}');
  }

}

void main() {
  // initialize student
  Map<StudentData,String> student1 = {StudentData.Name: 'Kevin', StudentData.Age: '21', StudentData.Depart: 'CS'};
  Map<StudentData,String> student2 = {StudentData.Name: 'Julia', StudentData.Age: '18', StudentData.Depart: 'Art'};
  print('$student1');
  print('$student2');
  //------------------- Class Using Contructor
  // Object Student with only one student1
  Student s1 = new Student(student1);
  s1.printStudent();
  s1._student[StudentData.Depart] = 'Electronics';
  s1.printStudent();
  // Object Student with List of student1,student2
  Student aS1 = new Student.StudentList([student1,student2]);
  aS1.printStudentList();
  //------------------- Class Using Setter/Getter
  // class CS using setter/getter with only one student1
  CS s2 = new CS();
  s2.SetStudent = student1;
  s2.printStudent();
  s2.SetStudentDepart = 'Computer Science';
  s2.printStudent();
  // class CS using setter/getter with List of student1,student2
  CS aS2 = new CS();
  aS2.SetStudentList = [student1,student2];
  aS2.printStudentList();
  aS2.SetStudentListIndexDepart = ["Digital Art", 1];
  aS2.printStudentList();
  //------------------- Class inheritent
  Cat c1 = new Cat(100,250);
  Dog d1 = new Dog(250,100);
  print('Cat health: ${c1.getHealth} VS Dog health: ${d1.getHealth}');
  c1.action();c1.setAction('attacking');c1.attack(20,d1);print('Cat health: ${c1.getHealth} VS Dog health: ${d1.getHealth}');
  d1.action();d1.setAction('hidding');d1.attack(30,c1);print('Cat health: ${c1.getHealth} VS Dog health: ${d1.getHealth}');
  //------------------- Class overloading
  c1.speaking();
  d1.speaking();
  print('access direct static var of Animal ${Animal.gen}');
  print('call direct static method of Animal ${Animal.getGen()}');
  //------------------- Cascade operator for Class
  new Cat(10,10)
  ..action()
  ..speaking();
}