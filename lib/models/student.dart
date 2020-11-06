class Student {
  int id;
  String fistName;
  String lastName;
  int grade;
  String _status;

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.fistName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student(String firstName, String lastName, int grade) {
    this.fistName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }
  Student.withoutInfo(){}

  String get getFirstName {
    return "OGR - " + this.fistName;
  }

  void set setFirstName(String value) {
    this.fistName = value;
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Gecti! :D";
    } else if (this.grade >= 40) {
      message = "Butunleme :/";
    } else {
      message = "Kaldi :(";
    }
    return message;
  }
}
