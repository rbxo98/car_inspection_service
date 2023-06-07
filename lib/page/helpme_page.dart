import 'package:car_inspection/widget/content_label.dart';
import 'package:car_inspection/widget/helpme_widgets/helpme_select_description.dart';
import 'package:car_inspection/widget/helpme_widgets/helpme_select_mycar.dart';
import 'package:car_inspection/widget/helpme_widgets/helpme_select_tip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/helpme_widgets/helpme_select_date.dart';
import '../widget/helpme_widgets/helpme_select_garage.dart';
import '../widget/helpme_widgets/helpme_select_pickup_time.dart';
import '../widget/helpme_widgets/helpme_select_place.dart';
import '../widget/helpme_widgets/helpme_submit.dart';

class HelpMePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HelpMePageState();
}

class HelpMePageState extends State<HelpMePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelpMeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContentLabel(label: "차량 선택"),
            HelpMeSelectMyCar(),
            ContentLabel(label: "지정 날짜 선택"),
            HelpMeSelectDate(),
            ContentLabel(label: "차량 인수 시간 선택"),
            HelpMeSelectPickUpTime(),
            ContentLabel(label: "차량 인수 장소 선택"),
            HelpMePickUpPlace(flag: true),
            ContentLabel(label: "차량 반납 장소 선택"),
            HelpMePickUpPlace(flag: false),
            ContentLabel(label: "팁"),
            HelpMeSelectTip(),
            ContentLabel(label: "지정 정비소"),
            HelpMeSelectGarage(),
            ContentLabel(label: "상세 설명"),
            HelpMeSelectDescription(),
          ].map((e) => Padding(padding: const EdgeInsets.fromLTRB(8,8,8,0),child: e,)).toList(),
        ),
      ),
      bottomNavigationBar: HelpMeSubmitButton(),
    );
  }
}

class HelpMeAppBar extends AppBar {
  HelpMeAppBar()
      : super(
          toolbarHeight: 60,
          backgroundColor: Color.fromRGBO(250, 250, 250, 1),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: const Text("신청서 작성"),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black),
        );
}
