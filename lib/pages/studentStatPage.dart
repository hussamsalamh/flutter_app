import 'package:flutter/material.dart';
import 'package:project/students/StudentsInfo.dart';
import "package:syncfusion_flutter_charts/charts.dart";

class StudentsStatPage extends StatefulWidget {
  late StudentsInfo student;

  StudentsStatPage(StudentsInfo s) {
    student = s;
  }

  @override
  _Students createState() => _Students(student);
}

class _Students extends State<StudentsStatPage> {
  late StudentsInfo student;

  _Students(StudentsInfo s) {
    student = s;
  }

  @override
  Widget build(BuildContext context) {
    // StudentsInfo student = StudentsInfo('maha', 2, 3);
    // List<ChartInfo> lst = <ChartInfo>[
    //   ChartInfo('jan', 10),
    //   ChartInfo('feb', 23),
    //   ChartInfo('feb', 23),
    //   ChartInfo('feb', 23),
    //   ChartInfo('feb', 23),
    //   ChartInfo('feb', 23),
    //   ChartInfo('feb', 23),
    //   ChartInfo('may', 23)
    // ];
    // student.addElementDatabase('13/5',100);
    // student.addElementDatabase('12/5',60);
    return Scaffold(
        appBar: AppBar(
          title: Text(student.name),
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
          child: ListView(
            children: [
              Center(
                child: Container(
                    child: SfCartesianChart(
                  series: <ChartSeries>[
                    StackedColumnSeries<ChartInfo, String>(
                      dataSource: student.info,
                      xValueMapper: (ChartInfo data, _) => data.x,
                      yValueMapper: (ChartInfo data, _) => data.y,
                      color: Colors.red
                    )
                  ],
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(
                      axisLine: AxisLine(width: 0), labelFormat: '{value} %'),
                  plotAreaBackgroundColor: Colors.white,
                )),
              ),
              Text('Number of Homework' + student.numberOfHomework.toString()),
            ],
          ),
        ));
  }
}
