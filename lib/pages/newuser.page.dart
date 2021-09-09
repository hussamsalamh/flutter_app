import 'package:flutter/material.dart';
import 'package:project/widget/loginPage/buttonNewUser.dart';
import 'package:project/widget/loginPage/newEmail.dart';
import 'package:project/widget/loginPage/newName.dart';
import 'package:project/widget/loginPage/password.dart';
import 'package:project/widget/loginPage/singup.dart';
import 'package:project/widget/loginPage/textNew.dart';
import 'package:project/widget/loginPage/userOld.dart';

class NewUser extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blueGrey, Colors.lightBlueAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SingUp(),
                    TextNew(),
                  ],
                ),
                NewNome(),
                NewEmail(),
                PasswordInput(),
                ButtonNewUser(),
                UserOld(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
