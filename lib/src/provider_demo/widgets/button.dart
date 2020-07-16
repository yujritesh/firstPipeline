import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Center(
        child: RaisedButton(
          child: Text('List screen'),
          onPressed: () => gotoListScreen(context),
        ),
      ),
    );
  }

  void gotoListScreen(BuildContext context) {
    Navigator.pushNamed(context, '/listscreen');
  }
}
