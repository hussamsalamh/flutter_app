import 'package:flutter/material.dart';

class TextBehavior extends StatefulWidget {
  @override
  _TextBehavior createState() => _TextBehavior();
}

class _TextBehavior extends State<TextBehavior> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 10.0),
      child: Container(
        // height: 200,
        // width: 200,
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
            ),
            Center(
              child: Text(
                'Behavior Page',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}