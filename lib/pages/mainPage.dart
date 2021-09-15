import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/pages/statisticsPage.dart';
import 'package:project/students/StudentsInfo.dart';
import 'StudentPage.dart';
import 'addStudentPage.dart';

class MainPage extends StatefulWidget {
  late String name;
  late String? id;

  MainPage(String n, String? i) {
    name = n;
    id = i;
  }

  @override
  _MainPage createState() => _MainPage(name, id);
}

class _MainPage extends State<MainPage> {
  late String name;
  late String? id;
  final List<StudentsInfo> lst = <StudentsInfo>[];
  String date = "";
  DateTime selectedDate = DateTime.now();

  _MainPage(String n, String? i) {
    lst.clear();
    name = n;
    id = i;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                  onPressed: () {
                    _selectDate(context);
                  },
                  padding: EdgeInsets.all(5.0),
                  color: Colors.white,
                  textColor: Color.fromRGBO(0, 160, 227, 1),
                  child: Text(
                      "Pick the date for class\n" +
                          "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                  onPressed: () async {
                    DateTime time = DateTime.now();
                    lst.clear();
                    var collection = FirebaseFirestore.instance.collection('students');
                    var docSnapshot = await collection.doc(id).get();
                    if (docSnapshot.exists) {
                      Map<String, dynamic>? data = docSnapshot.data();
                      print(data);
                      if (data != null) {
                        data.forEach((key, value) {
                          String name = data[key]['name'];
                          int id = int.parse(key);
                          value = value as Map;
                          int number = data[key]['homework'];
                          StudentsInfo student = StudentsInfo(name, id, number);
                          value.forEach((key1, value1) {
                            if (key1 != 'name' && key1 != 'homework') {
                              student.addElementDatabase(key1, value1['att']);
                            }
                          });
                          lst.add(student);
                        });
                      }
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StudentPage(lst, selectedDate, time,id)));
                  },
                  padding: EdgeInsets.all(10.0),
                  color: Colors.white,
                  textColor: Color.fromRGBO(0, 160, 227, 1),
                  child:
                      Text("Start the class", style: TextStyle(fontSize: 15)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                  onPressed: () async {
                    lst.clear();
                    var collection = FirebaseFirestore.instance.collection('students');
                    var docSnapshot = await collection.doc(id).get();
                    if (docSnapshot.exists) {
                      Map<String, dynamic>? data = docSnapshot.data();
                      print(data);
                      if (data != null) {
                        data.forEach((key, value) {
                          String name = data[key]['name'];
                          int id = int.parse(key);
                          value = value as Map;
                          int number = data[key]['homework'];
                          StudentsInfo student = StudentsInfo(name, id, number);
                          value.forEach((key1, value1) {
                            if (key1 != 'name' && key1 != 'homework') {
                              student.addElementDatabase(key1, value1['att']);
                            }
                          });
                          lst.add(student);
                        });
                      }
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StatisticsPage(lst)));
                  },
                  padding: EdgeInsets.all(10.0),
                  color: Colors.white,
                  textColor: Color.fromRGBO(0, 160, 227, 1),
                  child: Text("Statistics for students",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 50.0,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddStudent(id)));
                  },
                  padding: EdgeInsets.all(10.0),
                  color: Colors.white,
                  textColor: Color.fromRGBO(0, 160, 227, 1),
                  child: Text("Add Student", style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
        ));
  }

  void printLst(){
    for(var i =0 ;i<lst.length;i++){
      print(lst[0].name);
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }

  // Future<void> generateLst() async {
  //   var collection = FirebaseFirestore.instance.collection('students');
  //   var docSnapshot = await collection.doc(id).get();
  //   if (docSnapshot.exists) {
  //     Map<String, dynamic>? data = docSnapshot.data();
  //     print(data);
  //     if (data != null) {
  //       data.forEach((key, value) {
  //         String name = data[key]['name'];
  //         int id = int.parse(key);
  //         value = data[key] as Map;
  //         print("This value");
  //         print(value);
  //         int number = data[key]['homework'];
  //         StudentsInfo student = StudentsInfo(name, id, number);
  //         value.forEach((key1, value1) {
  //           if (key1 != 'name' && key1 != 'homework') {
  //             student.addElementDatabase(key1, value1['att']);
  //           }
  //         });
  //         lst.add(student);
  //       });
  //     }
  //   }
  // }
}
