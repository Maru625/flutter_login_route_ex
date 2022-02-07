import 'package:flutter/material.dart';
import 'package:login_route/models/probider_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavigationIndex = 0; //bottom navigation index state

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var DarwerState = context.watch<myLogin>().loginState;
    debugPrint("current state : ${context.watch<myLogin>().loginState}");
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Consumer<myLogin>(
                builder: (context, value, child) =>
                    userDrawerHeader(value.loginState)),
            ListTile(
              title: Text('Route 1'),
              onTap: () {
                Navigator.pushNamed(context, '/route1');
              },
            ),
            ListTile(
              title: Text('Route 2'),
              onTap: () {
                Navigator.pushNamed(context, '/route2');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            _bottomNavigationIndex = index;
          });
        },
        currentIndex: _bottomNavigationIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "chat",
          ),
        ],
      ),
    );
  }

  Widget userDrawerHeader(DarwerState) {
    if (DarwerState) {
      return UserAccountsDrawerHeader(
        //이형태는 사용자 계정을 나타내기 위한것, 일반적으로 사용하기 위해선 DrawerHeader를 사용하면 됨
        accountEmail: Text('gks_naver@naver.com'),
        accountName: Text('Dev'),
        onDetailsPressed: () {
          debugPrint('press details');
        },
        decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            )),
      );
    } else {
      return DrawerHeader(
        child: Column(
          children: <Widget>[
            Text("Drawer Header LOGOUT"),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/loginpage');
              },
              icon: Icon(Icons.login),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      );
    }
  }
}
