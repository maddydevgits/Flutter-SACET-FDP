class Person {
  String name = "";
  int age = 0;

  void introduce() {
    print("My name is $name and I am $age years old.");
  }
}

void main() {
  Person p = Person();
  p.name = "Sravani";
  p.age = 22;
  p.introduce();
}
