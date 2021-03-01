import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Text(
            'First Page',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ));
  }
}
