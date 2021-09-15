import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/students/StudentsInfo.dart';

class SubmissionButton extends StatefulWidget {
  late String? id;
  List<StudentsInfo> lst = <StudentsInfo>[];
  late String date;

  SubmissionButton(List<StudentsInfo> s, String? i, String d) {
    lst = s;
    id = i;
    date = d;
  }

  @override
  _SubmissionButton createState() => _SubmissionButton(lst, id, date);
}

class _SubmissionButton extends State<SubmissionButton> {
  List<StudentsInfo> lst = <StudentsInfo>[];
  late String? id;
  late String date;

  _SubmissionButton(List<StudentsInfo> s, String? i, String d) {
    lst = s;
    id = i;
    date = d;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blue,
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 1.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FlatButton(
          onPressed: () {
            submitData();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Submit ',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> submitData() async {
    var be = {0: "Exellent", 1: 'Good', 2: 'bad'};
    var collection = FirebaseFirestore.instance.collection('students');
    var docSnapshot = await collection.doc(id).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      if (data != null) {
        var homework = 0;
        try {
          for (var i = 0; i < lst.length; i++) {
            homework = data[lst[i].idNumber.toString()]['homework'];
            print(lst[i].idNumber.toString());
            if (lst[i].didHomework) {
              homework = homework + 1;
            }
            data[lst[i].idNumber.toString()]['homework'] = homework;
            if (lst[i].info.isNotEmpty) {
              data[lst[i].idNumber.toString()][date] ={
                'att':lst[i].info.last.y,
                'be':be[lst[i].behavior.index],
                'didHomework':lst[i].didHomework
                // ];
              };
            } else {
              // data[lst[i].idNumber.toString()]
                  // [date] = [0];
                  // [date] = 0;
                // be[lst[i].behavior.index],
                // lst[i].didHomework];
              data[lst[i].idNumber.toString()][date] ={
                'att':0,
                'be':be[lst[i].behavior.index],
                'didHomework':lst[i].didHomework
                // ];
              };
            }
          }
        } catch (e) {
          print('wtf');
          // if (lst.last.didHomework) {
          //   homework = homework + 1;
          // }
          // // data[lst.last.idNumber.toString()]['homework'] = homework;
          // if (lst.last.info.isNotEmpty) {
          //   data[lst.last.idNumber.toString()][date] =
          //     lst.last.info.last.y;
          //     // be[lst.last.behavior.index],
          //     // lst.last.didHomework
          //
          // } else {
          //   data[lst.last.idNumber.toString()]
          //       [date] = 0;
          //     // be[lst.last.behavior.index],
          //     // lst.last.didHomework
          //   // ];
          // }
        }
        FirebaseFirestore.instance.collection('students').doc(id).update(data);
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    }
  }
}
