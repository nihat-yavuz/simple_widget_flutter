import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(Student selectedStudents){
    this.selectedStudent = selectedStudents;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentEditState(selectedStudent);
  }
}

class _StudentEditState extends State with StudentValiditionMixin {
  Student selectedStudent;
  var formKey = GlobalKey<FormState>();

  _StudentEditState(Student selectedStudents){
    this.selectedStudent = selectedStudents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ogrenci Guncelle"),
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
      initialValue: selectedStudent.fistName,
      decoration: InputDecoration(labelText: "Adi",hintText: "Nihat"),
      validator: validateFirstName,
      onSaved: (String value){
        selectedStudent.fistName = value;
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(labelText: "Soyadi",hintText: "Yavuz"),
      validator: validateLastName,
      onSaved: (String value){
        selectedStudent.lastName = value;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Aldigi Not",hintText: "75"),
      validator: validateGrade,
      onSaved: (String value){
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Guncelle") ,
      onPressed: (){
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent.fistName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}
