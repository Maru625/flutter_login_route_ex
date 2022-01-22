import 'package:flutter/material.dart';

class RoutePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
          )
        ],
      ),
    );
  }
}
