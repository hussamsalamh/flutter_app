import 'package:flutter/material.dart';


enum Behavior {
  Excellent , Good, Bad
}

class pair{
  late DateTime a;
  late DateTime b;
  pair(this.a,this.b);

  void operator[]=(int index,DateTime n){
    if(index == 0){
      this.a = n;
    }else{
      this.b = n;
    }
  }

  DateTime operator[](int index){
    if(index == 0){return a;}
    return b;
  }

}

class StudentsInfo{

  // late String account;
  bool inClass = false;
  bool didHomework = false;
  late String name;
  late int idNumber;
  late Behavior behavior;
  late List<pair> time = <pair>[];
  int  totalTime = 0;


  StudentsInfo(String n,int id){
    name = n; idNumber = id;behavior = Behavior.Excellent;
  }

}


