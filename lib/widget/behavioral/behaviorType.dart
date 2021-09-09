import 'package:flutter/material.dart';

class BehaviorType extends StatefulWidget {
  @override
  _TextLoginState createState() => _TextLoginState();
}

class _TextLoginState extends State<BehaviorType> {
  @override
  Widget build(BuildContext context) {
    return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("",style: TextStyle(color: Colors.white,fontSize: 15),),
            Text("Excellent ",style: TextStyle(color: Colors.white,fontSize: 15),),
            Text("Very Good",style: TextStyle(color: Colors.white,fontSize: 15),),
            Text("GOOD ",style: TextStyle(color: Colors.white,fontSize: 15),),
            Text("DID Homework",style: TextStyle(color: Colors.white,fontSize: 15),)
          ],

    );
  }
}