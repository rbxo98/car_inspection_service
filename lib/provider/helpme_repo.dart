import 'package:flutter/material.dart';
import '../models/request_info.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

const String ApiUrl = "http://192.168.0.135:8000/api/RequestInfoApi/";

class HelpMeRepository with ChangeNotifier {
  RequestInfo request_info= RequestInfo();
  TimeOfDay? time;
  DateTime? date;


  Future<bool> postRequest() async {
    print(json.encode(request_info.toJson()));
    try {
      var respone = await http.post(Uri.parse(ApiUrl),
          headers: {"content-type": "application/json"},
          body: json.encode(request_info.toJson()));
      final int code=respone.statusCode;
      if (code < 200 || code >= 400){
        Fluttertoast.showToast(msg: "신청정보 등록 오류");
        return false;
      }
      else{
        Fluttertoast.showToast(msg: "해당 정보로 신청되었습니다.");
        return true;
      }
    } catch (e) {
      return false;
    }
  }

}