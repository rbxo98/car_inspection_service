import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:car_inspection/api.dart';
import 'package:car_inspection/models/user_info.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../models/mycar_info.dart';

const String ApiUrl = "http://168.131.224.49:8000/api/";

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  ByteData data = await rootBundle.load(path);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

Future<LatLng> getLatLngFromAddress(String query) async {
  var addresses = await Geocoder.google(ApiKey.googleMapKey).findAddressesFromQuery(query);
  var first = addresses.first;
  return LatLng(first.coordinates.latitude!, first.coordinates.longitude!);
}


Future<UserInfo?> getUserInfoFromSNSKey(String uid) async{
  try {
    var response =
    await http.get(Uri.parse(ApiUrl + "UserInfoApi/?SNSKey=" + uid));
    final int code = response.statusCode;
    if (code == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      print(data);
      if (!data.isEmpty) {
        return UserInfo.fromJson(data[0]);
      }
    }
    return null;
  } catch (e) {
    log(e.toString());
    return null;
  }
}




Future<MyCarInfo?> getMyCarInfoFromID(int id) async {
  try {
    var response =
    await http.get(Uri.parse(ApiUrl + "MyCarInfoApi/?id=" + id.toString()));
    final int code = response.statusCode;
    if (code == 200) {
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      print(data);
      if (!data.isEmpty) {
        return MyCarInfo.fromJson(data[0]);
      }
    }
    return null;
  } catch (e) {
    log(e.toString());
    return null;
  }
}
