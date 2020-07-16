import 'package:flutter/material.dart';
import 'package:flutter_app/src/provider_demo/mapper.dart';
import 'package:flutter_app/src/provider_demo/user.dart';
import 'package:http/http.dart' as http;

class ListState extends ChangeNotifier {
  ListState();

  String _url = "https://reqres.in/api/users?per_page=20";
  bool _isLoading = false;
  List<User> _users = List();

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    var response = await http.get(_url);
    if (response.statusCode == 200) {
      _users = UserMapper().fromResponseBody(response.body);
    }

    _isLoading = false;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  List<User> get getUsers => _users;
}


class Listener{
  void notify(){

  }
}