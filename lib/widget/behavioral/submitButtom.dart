import 'package:flutter/material.dart';
import 'package:project/students/StudentsInfo.dart';

class SubmissionButton extends StatefulWidget {
  List<StudentsInfo> lst = <StudentsInfo>[];
  SubmissionButton(List<StudentsInfo> s){lst = s;}
  @override
  _SubmissionButton createState() => _SubmissionButton(lst);
}

class _SubmissionButton extends State<SubmissionButton> {
  List<StudentsInfo> lst = <StudentsInfo>[];
  _SubmissionButton(List<StudentsInfo> s){
    lst = s;
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

//TODO : connect this shit to backend
  void submitData(){
    for(var i = 0;i < lst.length;i++){
      print(lst[i].name);
      lst[i].didHomework?print("yes"):print("No");
      print(lst[i].behavior.index.toString());
    }
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
