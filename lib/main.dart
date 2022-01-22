import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:login_route/models/probider_model.dart';
import 'package:login_route/pages/route_page1.dart';
import 'package:login_route/pages/route_page2.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return myLogin(); //probider_model.dart
          },
        ),
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          '/': (context) => const MyHomePage(),
          '/route1': (context) => RoutePage1(),
          '/route2': (context) => RoutePage2(),
          '/loginpage': (context) => LoginPage(),
        },
        //child 하위의 모든것들은 myLogin에 접근 가능
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const MyHomePage(),
      ),
    );
  }
}
