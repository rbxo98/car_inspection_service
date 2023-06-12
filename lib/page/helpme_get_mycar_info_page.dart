import 'dart:io';

import 'package:car_inspection/models/mycar_info.dart';
import 'package:car_inspection/provider/mycar_repo.dart';
import 'package:car_inspection/provider/user_repo.dart';
import 'package:car_inspection/widget/content_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class GetMyCarInfo extends StatelessWidget{
  late XFile image;
  TextEditingController myCarNameController = TextEditingController();
  TextEditingController myCarNumberController = TextEditingController();
  GetMyCarInfo({required this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetMyCarAppBar(),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContentLabel(label: "선택한 이미지"),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,20,20),
              child: Image.file(File(image.path)),
            ),
            ContentLabel(label:"차종"),
            TextField(
              controller: myCarNameController,
            ),
            ContentLabel(label:"차량번호"),
            TextField(
              maxLength: 8,
              controller: myCarNumberController,
            ),
          ].map((e) => Padding(padding: const EdgeInsets.fromLTRB(8,8,8,0),child: e,)).toList(),
        ),
      ),
      bottomNavigationBar: SizedBox(height:60,child: ElevatedButton(
        onPressed: () async {
          MyCarInfo myCarInfo = MyCarInfo(
            SNSKey: context.read<UserRepository>().user.SNSKey,
            name:myCarNameController.text,
            carNumber: myCarNumberController.text,
            vehicleRegistrationCertificateURL: image.path,
          );
          await myCarRepository.postMyCar(myCarInfo).then((value) {
            if(value){
              Navigator.pop(context);
              Navigator.pop(context);
            }
          });
        },
        child: Text("신청한 정보로 등록하기"),
      )),
    );
  }

}

class GetMyCarAppBar extends AppBar {
  GetMyCarAppBar()
      : super(
    toolbarHeight: 60,
    backgroundColor: Color.fromRGBO(250, 250, 250, 1),
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
    title: const Text("차량 정보 입력"),
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.black),
  );
}
