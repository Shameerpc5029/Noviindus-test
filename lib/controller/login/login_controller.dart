import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:moovbe_bus/model/login/login_model.dart';

import 'package:moovbe_bus/service/login/login_service.dart';
import 'package:moovbe_bus/view/home/home_screen.dart';

class LoginController extends ChangeNotifier {
  bool isLoading = false;

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  void login(context) async {
    isLoading = true;
    notifyListeners();
    final AuthModel model = AuthModel(
      username: username.text,
      password: password.text,
    );
    await LoginService().loginService(model).then((value) async {
      if (value != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false);
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  String? usernameValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter Username";
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "Please enter Password";
    }
    if (value.length < 8) {
      return "Password length must be atleast 8 characters";
    }
    return null;
  }
}
