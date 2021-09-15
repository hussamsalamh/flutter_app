import 'package:intl/intl.dart';

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

class ChartInfo{

  final String x;
  final double y;
  ChartInfo(this.x,this.y);

}


class StudentsInfo{

  // late String account;
  bool inClass = false;
  bool didHomework = false;
  int  totalTime = 0;
  late int numberOfHomework ;
  late String name;
  late int idNumber;
  late Behavior behavior;
  late List<pair> time = <pair>[];
  late List<ChartInfo> info = <ChartInfo>[];


  StudentsInfo(String n,int id,int m){
    name = n; idNumber = id;behavior = Behavior.Excellent;
    numberOfHomework = m;
  }

  void addElement(DateTime date,double pers){
    info.add(new ChartInfo(DateFormat('yyyy-MM-dd').format(date),pers));
  }
  void addElementDatabase(String date,double pers){

    info.add(ChartInfo(date, pers));
  }

}


