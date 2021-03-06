import 'package:flutter/material.dart';
import 'package:login_route/models/probider_model.dart';
import 'package:login_route/widgets/home_login_widget.dart';
import 'package:provider/provider.dart';

import '../widgets/home_logout_widget.dart';

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
    var DarwerState = Provider.of<myLogin>(context, listen: true).loginState;
    debugPrint("current state : ${context.watch<myLogin>().loginState}");
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: (Provider.of<myLogin>(context).loginState
            ? HomeLoginBody()
            : HomeLogoutBody()),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            userDrawerHeader(DarwerState),
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

  // build Drawer widget
  Widget userDrawerHeader(DarwerState) {
    if (DarwerState) {
      return UserAccountsDrawerHeader(
        //???????????? ????????? ????????? ???????????? ?????????, ??????????????? ???????????? ????????? DrawerHeader??? ???????????? ???
        accountEmail: Text('gks_naver@naver.com'),
        accountName: Text('Dev'),
        onDetailsPressed: () {
          debugPrint('press details');
          Navigator.pushNamed(context, '/userManagement');
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
                Navigator.pushNamed(context, '/loginpage');
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
