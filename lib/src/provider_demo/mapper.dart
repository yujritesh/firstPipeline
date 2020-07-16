import 'dart:convert';

import 'package:flutter_app/src/provider_demo/user.dart';

class UserMapper {
  List<User> fromResponseBody(String responseBody) {
    List<User> users = List<User>();
    var json = jsonDecode(responseBody);
    List<dynamic> data = json['data'];
    data.forEach((item) {
      User user = User(
          id: item['id'],
          email: item['email'],
          firstName: item['first_name'],
          lastName: item['last_name'],
          avatar: item['avatar']);
      users.add(user);
    });
    return users;
  }
}
