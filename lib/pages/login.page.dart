import 'package:flutter/material.dart';
import 'package:project/widget/loginPage/button.dart';
import 'package:project/widget/loginPage/first.dart';
import 'package:project/widget/loginPage/inputEmail.dart';
import 'package:project/widget/loginPage/password.dart';
import 'package:project/widget/loginPage/textLogin.dart';
import 'package:project/widget/loginPage/verticalText.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late InputEmail email;
  late PasswordInput passwordInput;

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
                Row(children: <Widget>[
                  VerticalText(),
                  TextLogin(),
                ]),
                email = InputEmail(),
                passwordInput = PasswordInput(),
                ButtonLogin(),
                FirstTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


