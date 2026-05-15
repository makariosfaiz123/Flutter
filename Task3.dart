void main() {
  Set<String> trainees = {};

  void insertTrainee(String traineeName) {
    trainees.add(traineeName);
  }

  void showNames(List<String> names, [int i = 0]) {
    if (i == names.length) return;

    print(names[i]);
    showNames(names, i + 1);
  }

  insertTrainee("John");
  insertTrainee("Mariam");
  insertTrainee("Khaled");

  print("Printing with recursion:");
  showNames(trainees.toList());

  print("\nPrinting with lambda:");
  trainees.forEach((item) {
    print(item);
  });

  Set<String> extraTrainees = {"Nada", "Youssef"};

  trainees.addAll(extraTrainees);

  print("\nAfter adding new trainees:");
  trainees.forEach((person) => print(person));

  Map<String, List<double>> marks = {};

  void addMark(String trainee, double score, [String subject = "Unknown"]) {
    marks.putIfAbsent(trainee, () => []);
    marks[trainee]!.add(score);
  }

  double calculateAverage(String trainee) {
    if (!marks.containsKey(trainee) || marks[trainee]!.isEmpty) {
      return 0;
    }

    double total =
        marks[trainee]!.reduce((value, element) => value + element);

    return total / marks[trainee]!.length;
  }

  addMark("John", 88, "Math");
  addMark("John", 96, "Programming");
  addMark("Mariam", 79, "Physics");

  print("\nAverage of John:");
  print(calculateAverage("John"));
}