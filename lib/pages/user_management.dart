import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/probider_model.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({Key? key}) : super(key: key);

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Provider.of<myLogin>(context, listen: false).changeLogout();
              Navigator.pushNamed(context, '/home');
            },
            child: Text("log out..."),
          ),
        ));
  }
}
