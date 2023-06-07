import 'dart:convert';

import 'package:car_inspection/models/mycar_info.dart';
import 'package:car_inspection/models/requestinfo_detail.dart';
import 'package:car_inspection/models/user_info.dart';
import 'package:car_inspection/script/get_somthing_from_something.dart';
import 'package:http/http.dart' as http;
import '../models/request_info.dart';


Future<RequestInfoDetail?> getRequestInfoDetail(RequestInfo requestInfo) async {
  RequestInfoDetail? data;
  await getUserInfoFromSNSKey(requestInfo.SNSKey!).then((userinfo) async {
    await getMyCarInfoFromID(requestInfo.myCarID!).then((carinfo) {
      print(carinfo!.SNSKey);
      if (userinfo != null && carinfo != null) {
        data = RequestInfoDetail();
        data!.userInfo = userinfo;
        data!.myCarInfo = carinfo;
      }
    });
  });
  return data;
}
