import 'package:car_inspection/provider/mycar_repo.dart';
import 'package:car_inspection/provider/user_repo.dart';
import 'package:car_inspection/widget/helpme_button.dart';
import 'package:car_inspection/widget/helpyou_button.dart';
import 'package:car_inspection/widget/banner_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/my_drawer.dart';
import 'helpme_page.dart';

class MyHomePage extends StatefulWidget {


  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    context.read<myCarRepository>().getMyCarFromSNSKey(context.watch<UserRepository>().user.SNSKey!);
    return Scaffold(
      appBar: MainAppBar(),
      endDrawer: MyDrawer(name:context.read<UserRepository>().user.Name!),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BannerSlide(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                HelpMeButton(),
                HelpYouButton(),
              ]
            )
          ],
        ),
      ),
    );
  }

}


class MainAppBar extends AppBar {
  MainAppBar()
      : super(
    toolbarHeight: 60,
    backgroundColor: Color.fromRGBO(250, 250, 250, 1),
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
    title: const Text("검차해줘"),
    titleTextStyle: TextStyle(color: Colors.black),
    actions: [
      IconButton(
        icon: Icon(Icons.notifications_none),
        onPressed: () {
        },
      ),
      Builder(builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.perm_identity),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        );
      })
    ],
  );
}