import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
