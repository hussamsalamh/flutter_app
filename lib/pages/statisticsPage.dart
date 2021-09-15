import 'package:flutter/material.dart';
import 'package:project/students/StudentsInfo.dart';
import 'package:project/widget/statisticsPage/studentsButton.dart';

class StatisticsPage extends StatefulWidget {
  late List<StudentsInfo> lst = <StudentsInfo>[];

  StatisticsPage(List<StudentsInfo> s) {
    lst = s;
  }

  @override
  _StatisticsPage createState() => _StatisticsPage(lst);
}

class _StatisticsPage extends State<StatisticsPage> {
  late List<StudentsInfo> lst = <StudentsInfo>[];
  late List<Widget> buttons = <Widget>[];

  _StatisticsPage(List<StudentsInfo> s) {
    lst = s;
  }

  @override
  Widget build(BuildContext context) {
    generateButtons();
    return Scaffold(
        appBar: AppBar(
          title: Text("Statistics for students"),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blueGrey, Colors.lightBlueAccent]),
            ),
            child: SingleChildScrollView(child: Column(children: buttons))));
  }

  void generateButtons() {
    for (var i = 0; i < lst.length; i++) {
      buttons.add(StudentButton(lst[i]));
    }
  }
}
