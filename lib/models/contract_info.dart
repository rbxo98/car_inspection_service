import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(includeIfNull: false)
class ContractInfo {
  DateTime? completeTime;
  int? finalPay;
  String? reservationNum;
  DateTime? pickedTime;
  int? contractProcess;
  String? agentUserSNSKey;
  int? requestInfoPostnum;

  ContractInfo({
    this.completeTime,
    this.finalPay,
    this.reservationNum,
    this.pickedTime,
    this.contractProcess,
    this.agentUserSNSKey,
    this.requestInfoPostnum,
  });

  ContractInfo.fromJson(Map<String, dynamic> json) {
    completeTime = json['CompleteTime'];
    finalPay = json['FinalPay'];
    reservationNum = json['ReservationNum'];
    pickedTime = json['PickedTime'];
    contractProcess = json['ContractProgress'];
    agentUserSNSKey = json['AgentUserSNSKey'];
    requestInfoPostnum = json['RequestInfoID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CompleteTime'] = this.completeTime;
    data['FinalPay'] = this.finalPay;
    data['ReservationNum'] = this.reservationNum;
    data['PickedTime'] = this.pickedTime;
    data['ContractProgress'] = this.contractProcess;
    data['AgentUserSNSKey'] = this.agentUserSNSKey;
    data['RequestInfoID'] = this.requestInfoPostnum;
    return data;
  }
}
