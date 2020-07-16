import 'package:flutter_app/src/provider_demo/user.dart';
import 'package:logger/logger.dart';
import 'package:retrofit/retrofit.dart';
import 'api_client.dart';
import 'package:dio/dio.dart';

abstract class UserRepository {
  @GET("/users?per_page=20")
  Future<List<User>> getUsers();
}

class UserRepositoryImpl {

  final logger = Logger();

  RestClient _client;

  UserRepositoryImpl(){
    final dio = Dio();   // Provide a dio instance
    dio.options.headers["Content-Type"] = "application/json";
    _client = RestClient(dio);
  }

  void getUsers() {}



}