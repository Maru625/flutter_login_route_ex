import 'package:flutter/material.dart';
import 'package:login_route/widgets/login_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
      ),
      body: Center(
        child: LoginWidget(),
      ),
    );
  }
}
