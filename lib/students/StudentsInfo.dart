import 'package:flutter/material.dart';


enum Behavior {
  Excellent , Good, Bad
}


class StudentsInfo{

  // late String account;
  late String name;
  late int idNumber;
  late Behavior behavior;
  late List<int> time;


  StudentsInfo(String n,int id){
    name = n; idNumber = id;
  }

}
