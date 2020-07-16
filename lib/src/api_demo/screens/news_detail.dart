import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  final int itemId;

  NewsDetail({this.itemId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News detail'),
      ),
      body: Center(
        child: Text(
          '$itemId',
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
