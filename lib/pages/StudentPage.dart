import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/students/StudentsInfo.dart';
import 'package:project/widget/studentPage/EndButton.dart';
import 'package:project/widget/studentPage/StartButton.dart';
import 'package:project/widget/studentPage/StudentInfoButton.dart';


class StudentPage extends StatefulWidget {
  late List<StudentsInfo> lst = <StudentsInfo>[];
  StudentPage(List<StudentsInfo> s){lst = s;}
  @override
  _StudentPage createState() => new _StudentPage(lst);
}

class _StudentPage extends State<StudentPage> {
  late List<StudentsInfo> lst = <StudentsInfo>[];
  late List<Widget> buttons = <Widget>[];

  _StudentPage(List<StudentsInfo>s){lst = s;}
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
                    children: <Widget>[StartButton(), EndButton(lst)],
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
    print(buttons.length);
  }
}
