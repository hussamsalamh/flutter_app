import 'package:flutter/material.dart';
import 'package:project/pages/behavioralPage.dart';
import 'package:project/students/StudentsInfo.dart';

//TODO : when press end class send the data to the firebase

class EndButton extends StatelessWidget{
  late List<StudentsInfo> students = <StudentsInfo>[];
  late DateTime endTime;
  bool flag = false;

  EndButton(List<StudentsInfo> s){
    students = s;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton.icon(
        // color: Color.green,
        label: Text(
          "End Class",
          style: TextStyle(fontSize: 13),
        ),

        onPressed: () {
          endTime = DateTime.now();
          endClass(context);
        },
        icon: Icon(Icons.ac_unit,
            size: 13, color: Colors.white),
      ),
    );
  }


  void calculatePercentage(StudentsInfo student){
    for(var i = 0;i < student.time.length;i++){
      student.totalTime += student.time[i][1]
          .difference(student.time[i][0]).inMinutes;
    }
    student.time.clear();
    student.inClass = false;
    print(student.name);
    print(student.totalTime.toString());
  }
  void endClass(BuildContext context){

    for(var i = 0; i < students.length;i++){
      if(students[i].inClass){
        students[i].time[students[i].time.length-1][1] = endTime;
      }
      calculatePercentage(students[i]);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BehavioralPage(students)),
    );
  }
}