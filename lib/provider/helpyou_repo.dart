import 'dart:convert';
import 'dart:developer';

import 'package:car_inspection/models/mycar_info.dart';
import 'package:car_inspection/models/requestinfo_detail.dart';
import 'package:car_inspection/models/user_info.dart';
import 'package:car_inspection/provider/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/request_info.dart';

const String ApiUrl = "http://192.168.0.135:8000/api/RequestInfoApi/";

class RequestRepository with ChangeNotifier {
  List<RequestInfo> requestList = [];
  List<RequestInfoDetail> reqeustDetailList = [];

  Future<bool> getRequestbyTime(DateTime? setTime) async {
    List<RequestInfo> meta = [];
    try {
      var response = await http.get(Uri.parse(ApiUrl +
          (setTime != null ? "?Time=" + setTime.toString() : "").toString()));
      if (response.statusCode == 200) {
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        if (!data.isEmpty) {
          for (int i = 0; i < data.length; i++) {
            meta.add(RequestInfo.fromJson(data[i]));
          }
          requestList = meta;
          notifyListeners();
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

}