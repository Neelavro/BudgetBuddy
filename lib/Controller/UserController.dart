

import 'package:budget_buddy/Repositories/UserRepository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Models/User.dart';

class UserController extends ControllerMVC{
  User user = User();

  Future<bool> CreateUser(User user)async {
    // book.id = id;
    var response = await UserCreate(user);
    return response;
  }

}