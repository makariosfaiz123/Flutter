class Student {
  String studentName;
  int _studentLevel;

  Student(this.studentName, this._studentLevel);

  int get level => _studentLevel;

  set level(int value) {
    if (value >= 1) {
      _studentLevel = value;
    } else {
      print("Level must be greater than 0");
    }
  }

  static String institute = "Faculty of Computers";
}

class Trainee extends Student {
  double bonus;

  Trainee(String studentName, int level, this.bonus)
      : super(studentName, level);

  void displayData() {
    print("Institute: ${Student.institute}");
    print("Student Name: $studentName");
    print("Level: $level");
    print("Bonus: $bonus");
  }
}

abstract class Abilities {
  void coding();
  void teamwork();
}

class MobileDeveloper extends Trainee implements Abilities {
  MobileDeveloper(String studentName, int level, double bonus)
      : super(studentName, level, bonus);

  @override
  void coding() {
    print("Coding Skill: Flutter developer");
  }

  @override
  void teamwork() {
    print("Teamwork Skill: Excellent collaboration");
  }
}

void main() {
  MobileDeveloper student =
      MobileDeveloper("Mina", 3, 5000);

  student.displayData();
  student.coding();
  student.teamwork();
}