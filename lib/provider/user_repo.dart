import 'dart:developer';

import 'package:car_inspection/models/agentuser_info.dart';
import 'package:car_inspection/models/mycar_info.dart';
import 'package:car_inspection/models/request_info.dart';
import 'package:car_inspection/models/user_info.dart';
import 'package:car_inspection/provider/mycar_repo.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../script/get_somthing_from_something.dart';

const String ApiUrl = "http://192.168.0.135:8000/api/";

class UserRepository with ChangeNotifier {
  late final UserInfo? _user;
  late final MyCarInfo? _myCar;
  late final AgentUserInfo? _agent_user;
  bool _isIdentified = false;

  UserInfo get user => _user!;
  MyCarInfo get myCar => _myCar!;
  AgentUserInfo get agent_user => _agent_user!;


  Future<bool?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        var result = await getUserInfoFromSNSKey(googleUser!.id);
        if (result!)
          {
            Fluttertoast.showToast(msg: "로그인 성공");
            _isIdentified=true;
            notifyListeners();
            return true;
          }
      return null;
    }
    on TypeError catch (e) {
      log(e.toString());
      Fluttertoast.showToast(msg: "구글 로그인 오류");
      return false;
    }
  }

  Future<bool?> getUserInfoFromSNSKey(String uid) async {
    try {
      var response =
      await http.get(Uri.parse(ApiUrl + "UserInfoApi/?SNSKey=" + uid));
      final int code = response.statusCode;
      if (code == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        if (!data.isEmpty) {
          _user = UserInfo.fromJson(data[0]);
          _myCar=MyCarInfo(SNSKey: _user!.SNSKey);
          _agent_user=AgentUserInfo(SNSKey: _user!.SNSKey);
          notifyListeners();
          return true;
        }
      }
      return null;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool?> signup(UserInfo user) async {
    try {
      var response = await http.post(Uri.parse(ApiUrl + "UserInfoApi/"),
          body: user.toJson());
      final int code = response.statusCode;
      if (code == 200) {
        Fluttertoast.showToast(msg: "회원가입 성공");
        return true;
      }
      return null;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}