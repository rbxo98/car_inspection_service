import 'dart:developer';

import 'package:car_inspection/api.dart';
import 'package:car_inspection/models/agentuser_info.dart';
import 'package:car_inspection/models/mycar_info.dart';
import 'package:car_inspection/models/request_info.dart';
import 'package:car_inspection/models/requestinfo_detail.dart';
import 'package:car_inspection/models/user_info.dart';
import 'package:car_inspection/provider/mycar_repo.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../script/get_somthing_from_something.dart';

const String ApiUrl = ApiKey.userinfoApi;

class UserRepository with ChangeNotifier {
  late UserInfo? _user = UserInfo();
  late final MyCarInfo? _myCar;
  late final AgentUserInfo? _agent_user;
  late List<RequestInfo> myReqeustList;
  late List<RequestInfoDetail> myRequestDetailList;

  UserInfo get user => _user!;

  MyCarInfo get myCar => _myCar!;

  AgentUserInfo get agent_user => _agent_user!;

  Future<dynamic> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser;
      await GoogleSignIn().signIn().then((value) {
        print(value);
        googleUser = value;
        notifyListeners();
      });
      print(googleUser!.id);
      _user!.SNSKey = googleUser!.id;
      var result = false;
      await getUserInfoFromSNSKey(googleUser!.id).then((value) {
        if (value!) {
          Fluttertoast.showToast(msg: "로그인 성공");
          notifyListeners();
          result = true;
        }
      });
      print(result);
      return result;
    } on TypeError catch (e) {
      log(e.toString());
      Fluttertoast.showToast(msg: "로그인 실패");
      return false;
    }
  }

  Future<bool?> getUserInfoFromSNSKey(String uid) async {
    try {
      var response =
          await http.get(Uri.parse(ApiUrl + "?SNSKey=" + uid));
      final int code = response.statusCode;
      if (code == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        if (!data.isEmpty) {
          var Data = UserInfo.fromJson(data[0]);
          _user!.SNSKey = Data.SNSKey;
          _user!.Name = Data.Name;
          _user!.BirthDay = Data.BirthDay;
          _user!.Tel = Data.Tel;
          _myCar = MyCarInfo(SNSKey: _user!.SNSKey);
          _agent_user = AgentUserInfo(SNSKey: _user!.SNSKey);
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
      print(user.SNSKey);
      print(user.Tel);
      _user = user;
      var response = await http.post(Uri.parse(ApiUrl),
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


  Future<bool?> getRequestInfoAll(String uid) async {
    myReqeustList=[];
    try {
      var response =
      await http.get(Uri.parse(ApiUrl + "RequestInfo/?SNSKey=" + uid));
      final int code = response.statusCode;
      if (code == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        if (!data.isEmpty) {
          for (var reqeustInfo in data){
            var Data = RequestInfo.fromJson(reqeustInfo);
            myReqeustList.add(Data);
            notifyListeners();
          }
          return true;
        }
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool?> getRequestInfoDetailAll(String uid) async {
    myRequestDetailList=[];
    try {
      var response =
      await http.get(Uri.parse(ApiUrl + "RequestInfo/?SNSKey=" + uid));
      final int code = response.statusCode;
      if (code == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        if (!data.isEmpty) {
          for (var reqeustInfo in data){
            var Data = RequestInfo.fromJson(reqeustInfo);
            myReqeustList.add(Data);
            notifyListeners();
          }
          return true;
        }
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }


}
