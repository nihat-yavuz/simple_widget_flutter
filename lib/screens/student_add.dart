import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(List<Student> students){
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValiditionMixin {
  List<Student> students;
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students){
    this.students = students;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ogrenci Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton(),
            ],
          ),
        ),
      )
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Adi",hintText: "Nihat"),
      validator: validateFirstName,
      onSaved: (String value){
        student.fistName = value;
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Soyadi",hintText: "Yavuz"),
      validator: validateLastName,
      onSaved: (String value){
        student.lastName = value;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldigi Not",hintText: "75"),
      validator: validateGrade,
      onSaved: (String value){
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet") ,
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          students.add(student);
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(student.fistName);
    print(student.lastName);
    print(student.grade);
  }
}
