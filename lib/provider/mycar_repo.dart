import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:car_inspection/api.dart';
import 'package:car_inspection/models/mycar_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

const String ApiUrl = ApiKey.myCarApi;

class myCarRepository with ChangeNotifier {
  late List<MyCarInfo> _myCars=[];
  List<MyCarInfo> get myCars => _myCars;



  Future<bool?> getMyCarFromSNSKey(String uid,{bool ispermmit=false}) async {
    _myCars=[];
    try {
      var response = await http.get(Uri.parse(ApiUrl + "?SNSKey=" + uid+"&permit="+(ispermmit?"True":"False")));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (!data.isEmpty) {
          for (int i = 0; i < data.length; i++) {
            _myCars.add(MyCarInfo.fromJson(data[i]));
          }
          notifyListeners();
          return true;
        }
        else{
          notifyListeners();
          return false;
        }
      }
    }  catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<bool> postMyCar(MyCarInfo myCarInfo) async {
    File imageFile = File(myCarInfo.vehicleRegistrationCertificateURL!);
    var request = http.MultipartRequest("POST", Uri.parse(ApiUrl));
    request.fields['SNSKey'] = myCarInfo.SNSKey!;
    request.fields['Name'] = myCarInfo.name!;
    request.fields['CarNumber'] = myCarInfo.carNumber!;
    request.fields['VehicleRegistrationCertificateURL'] = "UserInfo/"+myCarInfo.SNSKey.toString()+"VehicleRegistrationCertificateImg.jpg";
    request.files.add(
        await http.MultipartFile.fromPath('VehicleRegistrationCertificateImg', imageFile.path));
    var respone = await request.send();
    if (respone.statusCode < 200 || respone.statusCode >= 400) {
      Fluttertoast.showToast(msg: "차량 등록중 오류 발생");
      return false;
    }
    else {
      Fluttertoast.showToast(msg: "차량 등록 신청 성공");
      return true;
    }
  }

}