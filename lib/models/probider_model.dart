import 'package:flutter/material.dart';

// ignore: camel_case_types
class myLogin extends ChangeNotifier {
  bool _loginState = false;

  bool get loginState => _loginState;

  void changeLogin() {
    _loginState = !_loginState;
    notifyListeners();
    // 상태가 변경됨을 ChangeNotifierProvider에 알려주기 위해 notifyListeners()를 호출
  }

  void changeLogout() {
    _loginState = false;
    notifyListeners();
    // 상태가 변경됨을 ChangeNotifierProvider에 알려주기 위해 notifyListeners()를 호출
  }
}
