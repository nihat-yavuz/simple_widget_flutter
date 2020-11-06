class StudentValiditionMixin{

  String validateFirstName(String value){
    if(value.length < 3){
      return "Ad en az 3 karakter olmalidir";
    }
  }
  String validateLastName(String value){
    if(value.length < 3){
      return "Soyad en az 3 karakter olmalidir";
    }
  }
  String validateGrade(String value){
    var grade = int.parse(value);
    if(grade <0 || grade>100){
      return "Not 0 ile 100 arasinda olmalidir";
    }
  }
}