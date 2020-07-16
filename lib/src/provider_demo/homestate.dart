import 'package:flutter/material.dart';

class HomeState extends ChangeNotifier {
  HomeState();

  String _displayText = "";

  void setDisplayText(String text){
    _displayText = text;
    notifyListeners();
  }

  String get getDisplayText => _displayText;
}