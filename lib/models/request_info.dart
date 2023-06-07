import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(includeIfNull: false)
class RequestInfo {
  int? id;
  int? myCarID;
  String? pickupTime;
  String? pickupPlace;
  String? garage;
  int? serviceCharge;
  DateTime? completeTime;
  String? returnPlace;
  String? description;
  String? SNSKey;

  RequestInfo(
      {this.id,
      this.myCarID,
      this.pickupTime,
      this.pickupPlace,
      this.garage,
      this.serviceCharge,
      this.completeTime,
      this.returnPlace,
      this.description,
      this.SNSKey});

  RequestInfo.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    myCarID = json['MyCarID'];
    pickupTime =
        DateTime.parse(json['PickupTime'].toString()).toIso8601String();
    if (json['Garage'] != null) {
      garage = json['Garage'];
    }
    pickupPlace = json['PickupPlace'];
    serviceCharge = json['ServiceCharge'];
    if (json['CompleteTime'] != null) {
      completeTime = DateTime.parse(json['CompleteTime']);
    }
    returnPlace = json['ReturnPlace'];
    description = json['Description'];
    SNSKey = json['SNSKey'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this.id;
    data['MyCarID'] = this.myCarID;
    data['PickupTime'] =
        DateTime.parse(this.pickupTime.toString()).toIso8601String();
    data['PickupPlace'] = this.pickupPlace;
    data['Garage'] = this.garage;
    data['ServiceCharge'] = this.serviceCharge;
    data['CompleteTime'] = this.completeTime;
    data['ReturnPlace'] = this.returnPlace;
    data['Description'] = this.description;
    data['SNSKey'] = this.SNSKey;
    return data;
  }
}
