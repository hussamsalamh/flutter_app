import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/students/StudentsInfo.dart';
import 'package:project/widget/behavioral/studentSelect.dart';
import 'package:project/widget/behavioral/submitButtom.dart';
import 'package:project/widget/behavioral/titleBehavior.dart';

class BehavioralPage extends StatefulWidget {
  late String? id;
  late List<StudentsInfo> lst = <StudentsInfo>[];
  late String date;

  BehavioralPage(List<StudentsInfo> s, String i,String d) {
    lst = s;
    id = i;
    date = d;
  }

  @override
  _BehavioralPage createState() => _BehavioralPage(lst, id,date);
}

class _BehavioralPage extends State<BehavioralPage> {
  late String? id;
  late String date;
  late List<StudentsInfo> lst = <StudentsInfo>[];
  late List<Widget> buttons = <Widget>[];

  _BehavioralPage(List<StudentsInfo> s, String? i,String d) {
    lst = s;
    id = i;
    date = d;
  }

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBehavior(),
                  Divider(
                    thickness: 5,
                    height: 30,
                    color: Colors.white,
                  ),
                  Column(
                    children: buttons,
                  ),
                  SubmissionButton(lst, id,date)
                ],
              ),
            )));
  }

  void generateButton() {
    buttons.clear();
    for (var i = 0; i < lst.length; i++) {
      buttons.add(StudentSelect(lst[i]));
    }
  }
}
