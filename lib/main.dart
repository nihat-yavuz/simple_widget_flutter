import 'package:flutter/material.dart';
import 'package:temel_widget/models/student.dart';
import 'package:temel_widget/screens/student_add.dart';
import 'package:temel_widget/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Ogrenci Takip Ornek";

  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "Nihat", "Yavuz", 40),
    Student.withId(2, "Sena", "Caliskan", 75),
    Student.withId(3, "Berkay", "Yavuz", 25)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("Islem Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2020/04/18/18/20/catrina-5060422_960_720.jpg"),
                  ),
                  title: Text(students[index].fistName +
                      " " +
                      students[index].lastName),
                  subtitle: Text("Sinavdan aldigi not: " +
                      students[index].grade.toString() +
                      " | " +
                      students[index].getStatus),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      selectedStudent = students[index];
                    });
                  },
                );
              }),
        ),
        Text("Secili Ogrenci : " + selectedStudent.fistName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Ekle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Guncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentEdit(selectedStudent)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.redAccent,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var mesaj = "Silindi : " +
                      selectedStudent.fistName +
                      " " +
                      selectedStudent.lastName;
                  mesajGoster(context, mesaj);
                },
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
