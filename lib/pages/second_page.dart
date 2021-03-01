import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text(
            'Second Page',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ));
  }
}
