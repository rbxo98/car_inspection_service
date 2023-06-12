import 'package:car_inspection/models/contract_info.dart';
import 'package:flutter/material.dart';
import '../models/request_info.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../models/user_info.dart';

const String ApiUrl = "http://168.131.224.49:8000/api/ContractInfoApi/";

class ContractRepository with ChangeNotifier {
  ContractInfo contract = ContractInfo();

  void confirmRequest(RequestInfo requestInfo, UserInfo myInfo) async {
    contract = ContractInfo(
        agentUserSNSKey: myInfo.SNSKey,
        requestInfoPostnum: requestInfo.id,
        contractProcess: -1);
    await postContractInfo(contract).then((value) {contract=ContractInfo();});
  }
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
