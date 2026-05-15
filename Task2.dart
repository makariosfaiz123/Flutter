import 'dart:io';

void main() {
  List<String> students = [];
  List<List<double>> marks = [];

  stdout.write("How many students? ");
  int totalStudents = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < totalStudents; i++) {
    stdout.write("\nEnter student name: ");
    String studentName = stdin.readLineSync()!;

    students.add(studentName);

    stdout.write("Enter number of subjects: ");
    int totalSubjects = int.parse(stdin.readLineSync()!);

    List<double> scores = [];

    for (int j = 0; j < totalSubjects; j++) {
      stdout.write("Subject ${j + 1} grade: ");
      double degree = double.parse(stdin.readLineSync()!);

      scores.add(degree);
    }

    marks.add(scores);
  }

  bool running = true;

  while (running) {
    print("\n===== MENU =====");
    print("1. Display Students Results");
    print("2. Find Student");
    print("3. Close Program");

    stdout.write("Enter choice: ");
    int option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        for (int i = 0; i < students.length; i++) {
          double total = 0;

          for (double value in marks[i]) {
            total += value;
          }

          double average = total / marks[i].length;

          String rate;

          if (average >= 85) {
            rate = "Excellent";
          } else if (average >= 70) {
            rate = "Very Good";
          } else if (average >= 50) {
            rate = "Good";
          } else {
            rate = "Fail";
          }

          print(
              "${students[i]} => Average: ${average.toStringAsFixed(1)} | Rate: $rate");
        }
        break;

      case 2:
        stdout.write("Enter student name to search: ");
        String wantedName = stdin.readLineSync()!;

        bool found = false;

        for (int i = 0; i < students.length; i++) {
          if (students[i].toLowerCase() ==
              wantedName.toLowerCase()) {
            double total = 0;

            for (double value in marks[i]) {
              total += value;
            }

            double average = total / marks[i].length;

            print(
                "${students[i]} average is ${average.toStringAsFixed(2)}");

            found = true;
            break;
          }
        }

        if (!found) {
          print("No student found with this name.");
        }

        break;

      case 3:
        running = false;
        print("Program ended.");
        break;

      default:
        print("Invalid choice.");
    }
  }
}