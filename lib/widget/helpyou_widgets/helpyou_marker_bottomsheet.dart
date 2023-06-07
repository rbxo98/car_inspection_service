import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/contract_info.dart';
import '../../models/request_info.dart';
import '../../models/requestinfo_detail.dart';
import '../../provider/user_repo.dart';
import '../../script/confirm_request.dart';

SingleChildScrollView ContractContainers(
  BuildContext context,
  List<RequestInfo> requestInfoList,
  List<RequestInfoDetail> requestInfoDetailList,
) {
  List<ExpansionPanelRadio> itemList = [];
  Map<int, ExpansionPanelRadio> valueList = {};
  for (int i = 0; i < requestInfoDetailList.length; i++) {
    itemList.add(ExpansionPanelRadio(
      value: requestInfoList[i].id!,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            Text(
              "상세 정보",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "픽업 장소",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(requestInfoList[i].pickupPlace!),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                "차종",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Text(requestInfoDetailList[i].myCarInfo!.name!),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                "지정 정비소",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Text(requestInfoList[i].garage == null
                ? ""
                : requestInfoList[i].garage!),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                "반납 희망 장소",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Text(requestInfoList[i].returnPlace!),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                "메모 사항",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            TextFormField(
                style: TextStyle(fontSize: 12),
                minLines: 6,
                maxLines: null,
                readOnly: true,
                initialValue: requestInfoList[i].description!,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: SizedBox(
                height: 50,
                width: 10000,
                child: ElevatedButton(
                  child: Text("수락"),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("신청서 수락 확인",
                                style: TextStyle(
                                  fontSize: 17,
                                )),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  Text("이 신청을 수락하시겠습니까?",
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    confirmRequest(requestInfoList[i].id!,
                                        context.read<UserRepository>().user);
                                    Navigator.pop(context);
                                  },
                                  child: Text("네")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("아니오")),
                            ],
                          );
                        });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      headerBuilder: (BuildContext context, bool isExpanded) {
        List<String> dateTime =
            requestInfoList[i].pickupTime.toString().split("T");

        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child:
                        SizedBox(height: 70, width: 70, child: CircleAvatar()),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            requestInfoDetailList[i].userInfo!.Name!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text("일시: " +
                              dateTime[0] +
                              " " +
                              dateTime[1].substring(0, 5)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3),
                          child:
                              Text(requestInfoList[i].serviceCharge.toString()),
                        ),
                      ])
                ],
              ),
            ],
          ),
        );
      },
    ));
  }
  for (int i = 0; i < requestInfoList.length; i++) {
    valueList[requestInfoList[i].id!] = itemList[i];
  }
  return SingleChildScrollView(
    child: Column(
      children: [
        ExpansionPanelList.radio(
          children: itemList,
          animationDuration: Duration(milliseconds: 500),
        ),
      ],
    ),
  );
}
