import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/widget/loginPage/first.dart';
import 'package:project/widget/loginPage/textLogin.dart';
import 'package:project/widget/loginPage/verticalText.dart';

import 'mainPage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  late User user ;

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
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  controller: password,
                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                  obscureText: true,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 50.0,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side:
                            BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                    onPressed: () async {
                      try {
                        print(email.text + "  username");
                        print(password.text + "  password");
                        User? user =
                            (await _auth.signInWithEmailAndPassword(
                                email: email.text.trim(), password: password.text.trim())).user;
                        // FirebaseFirestore.instance
                        //     .collection('users')
                        //     .where('name')
                        //     .get();

                          // You can then retrieve the value from the Map like this:

                        if (user !=null){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MainPage('hussam',user.uid)));
                        }
                      } catch (e) {
                        print("Error catch");
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("failed"),
                        )
                        );
                      }
                      email.clear();password.clear();
                    },
                    padding: EdgeInsets.all(10.0),
                    color: Colors.white,
                    textColor: Color.fromRGBO(0, 160, 227, 1),
                    child: Text("Ok", style: TextStyle(fontSize: 15)),
                  ),
                ),
                FirstTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Stream<DocumentSnapshot> provideDocumentFieldStream() {
  //   return Firestore.instance
  //       .collection('collection')
  //       .document('document')
  //       .snapshots();
  // }




}
