import 'dart:convert';

import 'package:car_inspection/models/request_info.dart';
import 'package:car_inspection/models/user_info.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../models/contract_info.dart';

const String ApiUrl = "http://192.168.0.135:8000/api/ContractInfoApi/";

void confirmRequest(int id, UserInfo myInfo) async {
  ContractInfo contractInfo = ContractInfo(
      agentUserSNSKey: myInfo.SNSKey,
      requestInfoPostnum: id,
      contractProcess: -1);
  await postContractInfo(contractInfo);
}

Future<bool> postContractInfo(ContractInfo contractInfo) async {
  try {
    var respone = await http.post(Uri.parse(ApiUrl),
        headers: {"content-type": "application/json"},
        body: json.encode(contractInfo.toJson()));
    final int code = respone.statusCode;
    if (code < 200 || code >= 400) {
      Fluttertoast.showToast(msg: "오류");
      return false;
    }
    Fluttertoast.showToast(msg: "신청 수락 성공");
    return true;
  } catch (e) {
    return false;
  }
}
