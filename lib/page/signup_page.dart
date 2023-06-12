import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../models/user_info.dart';
import '../provider/user_repo.dart';
import 'home_page.dart';

class SignupPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SignupPageState();
  }
}

class SignupPageState extends State<SignupPage> {

  TextEditingController NameController = TextEditingController();
  TextEditingController BirthDayController = TextEditingController();
  TextEditingController TelController = TextEditingController();

  Widget _nickname() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "닉네임",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: NameController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: '4글자 이상, 12글자 이하',
            ),
            maxLength: 12,
            keyboardType: TextInputType.name,
          ),
        ],
      ),
    );
  }

  Widget _birthday() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "생년월일",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: BirthDayController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: '8자리(yyyymmdd)',
            ),
            keyboardType: TextInputType.number,
            maxLength: 8,
          ),
        ],
      ),
    );
  }

  Widget _tel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "전화번호",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: TelController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: '- 빼고 입력',
            ),
            maxLength: 11,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '회원가입',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10,
            ),
            _nickname(),
            const SizedBox(
              height: 10,
            ),
            _birthday(),
            const SizedBox(
              height: 10,
            ),
            _tel(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 50,
        ),
        child: ElevatedButton(
          onPressed: () async {
            await context.read<UserRepository>().signup(
              UserInfo(SNSKey: context.read<UserRepository>().user.SNSKey,
              Name:NameController.text,
              Tel: TelController.text,
              BirthDay: BirthDayController.text)
            ).then((value) {
              if(value!){
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MyHomePage()),
                        (route) => false);
              }
              else{
                Fluttertoast.showToast(msg: "회원가입 오류");
              }
            });
          },
          child: const Text('회원가입'),
        ),
      ),
    );
  }
}
