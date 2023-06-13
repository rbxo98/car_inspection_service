import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_repo.dart';
class MySchedulePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MySchedulePageState();
}

class MySchedulePageState extends State<MySchedulePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyScheduleAppBar(),
      body: Column(
        children: [
          Container(
            height: 30,
          ),
          TabBar(
            controller: _tabController,
            tabs: [
              Container(
                alignment: Alignment.center,
                height: 60,
                child: Text("나의 검차",style: TextStyle(color: Colors.black),),
              ),
              Container(
                alignment: Alignment.center,
                height: 60,
                child: Text("나의 대행",style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              SingleChildScrollView(
                  child: Center(child: Text("진행중인 검차 내용이 없습니다."))),
              SingleChildScrollView(
                  child: Center(child: Text("진행중인 검차 대행 내용이 없습니다."))),
            ]),
          )
        ],
      ),
    );
  }
}

class MyScheduleAppBar extends AppBar {
  MyScheduleAppBar()
      : super(
          toolbarHeight: 60,
          backgroundColor: Color.fromRGBO(250, 250, 250, 1),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: const Text("진행 현황"),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black),
        );
}
