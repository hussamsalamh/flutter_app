import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/students/StudentsInfo.dart';
import 'package:project/widget/studentPage/EndButton.dart';
import 'package:project/widget/studentPage/StudentInfoButton.dart';


class StudentPage extends StatefulWidget {
  late String? id;
  late List<StudentsInfo> lst = <StudentsInfo>[];
  late DateTime selectedDate;
  late DateTime startTime;
  StudentPage(List<StudentsInfo> s,DateTime t,DateTime start,String? i)
  {lst = s;selectedDate = t;startTime = start;id = i;}
  @override
  _StudentPage createState() => new _StudentPage(lst,selectedDate,startTime,id);
}

class _StudentPage extends State<StudentPage> {
  late String? id;
  late List<StudentsInfo> lst = <StudentsInfo>[];
  late List<Widget> buttons = <Widget>[];
  late DateTime selectedDate;
  late DateTime startTime;

  _StudentPage(List<StudentsInfo>s,DateTime t,DateTime start,String? i)
  {lst = s;selectedDate = t;startTime = start; id = i;}
  @override
  Widget build(BuildContext context) {
    generateButton();
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blueGrey, Colors.lightBlueAccent]),
            ),
            child: ListView(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[ EndButton(lst,selectedDate,startTime,id)],
                  ),
                  Divider(
                    thickness: 5,
                    height: 30,
                    color: Colors.white,
                  ),
                ],
              ),
              Column(children: buttons,)
            ])));

  }



  void generateButton() {
    buttons.clear();
    for (var i = 0; i < lst.length; i++) {
      buttons.add(StudentInfoButton(lst[i]));
    }
  }
}
