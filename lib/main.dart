import 'package:flutter/material.dart';
import 'package:project/pages/behavioralPage.dart';
import 'package:project/pages/login.page.dart';
import 'package:project/widget/behavioral/studentSelect.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khawarizmi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

