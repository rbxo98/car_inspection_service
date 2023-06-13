import 'dart:typed_data';

import 'package:car_inspection/provider/user_repo.dart';
import 'package:car_inspection/script/confirm_request.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../models/request_info.dart';
import '../models/requestinfo_detail.dart';
import '../script/get_somthing_from_something.dart';
import '../widget/helpyou_widgets/helpyou_marker_bottomsheet.dart';

class MarkersRepository with ChangeNotifier {
  Map<String, Marker> markers = {};

  void getMarker(BuildContext context, List<RequestInfo> requestInfoList,
      List<RequestInfoDetail> requestInfoDetail) async {
    print(1);
    Uint8List markerIcon =
    await getBytesFromAsset('lib/assets/help_mark.png', 50);
    Map<String, List<RequestInfo>> requestMap = {};
    Map<String, List<RequestInfoDetail>> requestDetailMap = {};
    List<String> addressList = [];

    for (int i=0;i<requestInfoList.length;i++){
      if (requestMap.containsKey(requestInfoList[i].pickupPlace)) {
        requestMap[requestInfoList[i].pickupPlace]!.add(requestInfoList[i]);
        requestDetailMap[requestInfoList[i].pickupPlace]!.add(requestInfoDetail[i]);
      }
      else {
        requestMap[requestInfoList[i].pickupPlace!] = [requestInfoList[i]];
        requestDetailMap[requestInfoList[i].pickupPlace!] = [requestInfoDetail[i]];
      }

      if (!addressList.contains(requestInfoList[i].pickupPlace)) {
        addressList.add(requestInfoList[i].pickupPlace!);
      }
    }

    for (String address in addressList){
        markers[address]=
            Marker(
                markerId: MarkerId(address),
                icon: BitmapDescriptor.fromBytes(markerIcon),
                position: await getLatLngFromAddress(address),
                onTap: () async {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.9,
                          child: Scaffold(
                            appBar: AppBar(
                              toolbarHeight: 60,
                              backgroundColor: Color.fromRGBO(250, 250, 250, 1),
                              iconTheme: IconThemeData(color: Colors.black),
                              elevation: 0,
                              title: Text("신청서 정보"),
                              titleTextStyle: TextStyle(color: Colors.black),
                              centerTitle: true,
                            ),
                            body: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ContractContainers(
                                  context, requestMap[address]!, requestDetailMap[address]!),
                            ),
                          ),
                        );
                      });
                });
        notifyListeners();
    }
  }
}

