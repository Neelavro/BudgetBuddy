

import 'package:budget_buddy/Repositories/UserRepository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../Models/User.dart';

class UserController extends ControllerMVC{
  User user = User();

  Future<void> CreateUser(User user)async {
    var response = await createuser(user);
  }

  Future<void> getcurrentUser(String email)async {
    var response = await getCurrentUser(email);
  }

}