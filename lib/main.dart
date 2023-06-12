import 'package:car_inspection/page/home_page.dart';
import 'package:car_inspection/page/signup_page.dart';
import 'package:car_inspection/provider/helpyou_repo.dart';
import 'package:car_inspection/provider/markers_repo.dart';
import 'package:car_inspection/provider/mycar_repo.dart';
import 'package:car_inspection/provider/user_repo.dart';
import 'package:car_inspection/script/get_somthing_from_something.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import 'models/user_info.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserRepository()),
        ChangeNotifierProvider(create: (_) => myCarRepository()),
        ChangeNotifierProvider(create: (_) => RequestRepository()),
        ChangeNotifierProvider(create: (_) => MarkersRepository()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ListenableProvider(create: (context) => UserRepository()),
          ListenableProvider(create: (context) => myCarRepository()),
          ListenableProvider(create: (context) => RequestRepository()),
          ListenableProvider(create: (context) => MarkersRepository()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginPage(),
        ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          '로그인',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await context.read<UserRepository>().signInWithGoogle().then((value) {
              if (value!) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage()),
                    (route) => false);
              }
              else{
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignupPage()),
                        (route) => false);
              }
            });
          },
          child: const Text('구글로그인'),
        ),
      ),
    );
  }
}
