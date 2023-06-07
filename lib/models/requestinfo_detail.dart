import 'package:car_inspection/models/user_info.dart';

import 'mycar_info.dart';

class RequestInfoDetail {
  UserInfo? userInfo;
  MyCarInfo? myCarInfo;

  RequestInfoDetail({
    this.userInfo,
    this.myCarInfo,
  });

  RequestInfoDetail.fromJson(Map<String, dynamic> json) {
    userInfo = json['UserInfo'];
    myCarInfo = json['MyCarInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserInfo'] = this.userInfo;
    data['MyCarInfo'] = this.myCarInfo;
    return data;
  }

  fromJson(e) {}
}
