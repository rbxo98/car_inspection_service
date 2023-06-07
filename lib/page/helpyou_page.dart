import 'package:car_inspection/page/helpme_page.dart';
import 'package:car_inspection/provider/helpme_repo.dart';
import 'package:car_inspection/provider/helpyou_repo.dart';
import 'package:car_inspection/widget/helpyou_widgets/helpyou_marker_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class HelpYouPage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() => HelpYouPageState();
//
// }

class HelpYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelpYouAppBar(),
      body: Stack(
        children: [
          MarkerMap(),
        ],
      ),
    );
  }
}

class HelpYouAppBar extends AppBar {
  HelpYouAppBar()
      : super(
          toolbarHeight: 60,
          backgroundColor: Color.fromRGBO(250, 250, 250, 1),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: const Text("신청 정보 조회"),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black),
        );
}
