import 'package:flutter/material.dart';
import 'package:project/pages/StudentPage.dart';
import 'package:project/students/StudentsInfo.dart';


// TODO : Need to give username and password to check them


class ButtonLogin extends StatefulWidget {

  @override
  _ButtonLoginState createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  List<StudentsInfo> lst = <StudentsInfo>[];
  // _ButtonLoginState(List<StudentsInfo> s){lst = s;}
  _ButtonLoginState(){
    lst.clear();
    lst.add(StudentsInfo('maha', 2));
    lst.add(StudentsInfo('ahmad', 3));
    lst.add(StudentsInfo('hello', 1));
    lst.add(StudentsInfo('zeus', 4));
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 50, left: 190),
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
            // TODO : Check the email and username
            Navigator.push(
                context,
              MaterialPageRoute(builder: (context) => StudentPage(lst)),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'OK',
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
}
