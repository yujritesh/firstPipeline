import 'package:flutter_app/src/provider_demo/user_repository.dart';

class GetUserUseCase {
  UserRepositoryImpl respository;

  GetUserUseCase() {
    respository = UserRepositoryImpl();
  }

  getUsers() {
    respository.getUsers();
  }
}
