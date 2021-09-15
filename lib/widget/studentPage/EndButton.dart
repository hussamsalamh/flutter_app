import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/pages/behavioralPage.dart';
import 'package:project/students/StudentsInfo.dart';

//TODO : when press end class send the data to the firebase

class EndButton extends StatelessWidget {
  late List<StudentsInfo> students = <StudentsInfo>[];
  late DateTime startTime;
  late DateTime endTime;
  late DateTime selectedDate;
  late String? id;
  bool flag = false;

  EndButton(List<StudentsInfo> s, DateTime t, DateTime d, String? i) {
    selectedDate = t;
    students = s;
    startTime = d;
    id = i;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton.icon(
        // color: Colors.white,
        label: Text(
          "End Class",
          style: TextStyle(fontSize: 13),
        ),

        onPressed: () {
          endTime = DateTime.now();
          endClass(context);
        },
        icon: Icon(Icons.ac_unit, size: 13, color: Colors.white),
      ),
    );
  }

  void calculatePercentage(StudentsInfo student) {
    for (var i = 0; i < student.time.length; i++) {
      student.totalTime +=
          student.time[i][1].difference(student.time[i][0]).inMinutes;
    }
    if (endTime.difference(startTime).inMinutes != 0) {
      student.addElement(selectedDate,
          student.totalTime / (endTime.difference(startTime).inMinutes));
    }

    student.time.clear();
    student.inClass = false;
  }

  void endClass(BuildContext context) {
    for (var i = 0; i < students.length; i++) {
      if (students[i].inClass) {
        students[i].time[students[i].time.length - 1][1] = endTime;
      }
      calculatePercentage(students[i]);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BehavioralPage(
              students, id!, DateFormat('yyyy-MM-dd').format(selectedDate))),
    );
  }
}
