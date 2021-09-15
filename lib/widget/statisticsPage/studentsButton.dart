import 'package:flutter/material.dart';
import 'package:project/pages/studentStatPage.dart';
import 'package:project/students/StudentsInfo.dart';

class StudentButton extends StatefulWidget {
  late StudentsInfo studentsInfo;

  StudentButton(StudentsInfo s) {
    studentsInfo = s;
  }

  _StudentButton createState() => _StudentButton(studentsInfo);
}

class _StudentButton extends State<StudentButton> {
  late StudentsInfo student;

  _StudentButton(StudentsInfo s) {
    student = s;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:OutlineButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentsStatPage(student)));
          },
          child: Text(student.name,style: TextStyle(
          ),),
          highlightColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
        )
    );
  }
}


