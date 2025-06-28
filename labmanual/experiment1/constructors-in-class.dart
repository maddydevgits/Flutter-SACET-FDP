class Student {
  String name;
  int rollNo;

  Student(this.name, this.rollNo);

  void showDetails() {
    print("Name: $name, Roll No: $rollNo");
  }
}

void main() {
  Student s = Student("Madhu", 101);
  s.showDetails();
}
