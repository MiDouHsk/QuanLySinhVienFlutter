import 'package:flutter/material.dart';
import 'package:quanlysinhvien/repositories/login_repository.dart';

class LoginViewModel with ChangeNotifier {
  String errorMessage = "";
  int status = 0; // 0: not login, 1"waitings, 2:error, 3:already logged.
  LoginRepository loginRepo = LoginRepository();
  Future<void> login(String username, String password) async {
    status = 1;
    notifyListeners();
    try {
      var profile = await loginRepo.login(username, password);
      if (profile.token == "") {
        status = 2;
        errorMessage = "Username or Password not Correct!";
      } else {
        status = 3;
      }
      notifyListeners();
    } catch (e) {}
  }
}
