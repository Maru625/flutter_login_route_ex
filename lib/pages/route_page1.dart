import 'package:flutter/material.dart';

class RoutePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
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
