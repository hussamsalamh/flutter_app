import 'package:flutter/material.dart';
import 'package:project/students/StudentsInfo.dart';
@immutable
class StudentSelect extends StatefulWidget {
  late StudentsInfo studentsInfo;

  StudentSelect(StudentsInfo s) {
    studentsInfo = s;
  }

  _StudentSelect createState() => _StudentSelect(studentsInfo);
}

class _StudentSelect extends State<StudentSelect> {
  late StudentsInfo student;

  _StudentSelect(StudentsInfo s) {
    student = s;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("   "),
            Text(student.name),
            Radio(
                value: Behavior.Excellent,
                groupValue: student.behavior,
                onChanged: (val) {
                  setState(() {
                    student.behavior = Behavior.Excellent;
                  });
                }),
            Text("E"),
            Radio(
                value: Behavior.Good,
                groupValue: student.behavior,
                onChanged: (val) {
                  setState(() {
                    student.behavior = Behavior.Good;
                  });
                }),
            Text("G"),
            Radio(
                value: Behavior.Bad,
                groupValue: student.behavior,
                onChanged: (val) {
                  setState(() {
                    student.behavior = Behavior.Bad;
                  });
                }),
            Text("B"),
            Text("     "),
            InkWell(
                onTap: () {
                  setState(() {
                    student.didHomework = !student.didHomework;
                  });
                },
                child: Chip(
                  backgroundColor:
                      student.didHomework ? Colors.green : Colors.white54,
                  label: Text("Homework"),
                )),
            Text(""),
          ],
        ));
  }
}
