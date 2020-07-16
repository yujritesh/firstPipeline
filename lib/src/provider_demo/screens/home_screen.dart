import 'package:flutter/material.dart';
import 'package:flutter_app/src/provider_demo/widgets/button.dart';
import 'package:flutter_app/src/provider_demo/widgets/edit_text.dart';
import 'package:flutter_app/src/provider_demo/widgets/test_display.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextDisplay(),
              EditText(),
              Button(),
            ],
          ),
        ),
      ),
    );
  }
}
