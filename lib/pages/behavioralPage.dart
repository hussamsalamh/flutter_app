import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/students/StudentsInfo.dart';
import 'package:project/widget/behavioral/studentSelect.dart';
import 'package:project/widget/behavioral/submitButtom.dart';
import 'package:project/widget/behavioral/titleBehavior.dart';

class BehavioralPage extends StatefulWidget {
  late List<StudentsInfo> lst = <StudentsInfo>[];

  BehavioralPage(List<StudentsInfo>s){
    lst = s;
  }
  @override
  _BehavioralPage createState() => _BehavioralPage(lst);
}

class _BehavioralPage extends State<BehavioralPage> {
  late List<StudentsInfo> lst = <StudentsInfo>[];
  late List<Widget> buttons = <Widget>[];

  _BehavioralPage(List<StudentsInfo>s){lst = s;}
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
                  Column(children: buttons,),
                  SubmissionButton(lst)
                ],
              ),
            )));
  }

  void generateButton() {
    buttons.clear();
    for (var i = 0; i < lst.length; i++) {
      buttons.add(StudentSelect(lst[i]));
    }
    print(buttons.length);
  }
}
