import 'package:car_inspection/models/mycar_info.dart';
import 'package:car_inspection/provider/helpyou_repo.dart';
import 'package:car_inspection/provider/markers_repo.dart';
import 'package:car_inspection/provider/mycar_repo.dart';
import 'package:car_inspection/script/get_requestinfo_detail.dart';
import 'package:car_inspection/widget/helpyou_widgets/helpyou_marker_bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../../models/request_info.dart';
import '../../models/user_info.dart';
import '../../provider/user_repo.dart';

class MarkerMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MarkerMapState();
}

class MarkerMapState extends State<MarkerMap> {
  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) async {
        print("oncreate");
        context
            .read<RequestRepository>()
            .getRequestbyTime(DateTime.now(),context.read<UserRepository>().user.SNSKey!)
            .then((value) async {
          if (value) {
            print("get request");
            for (RequestInfo request
                in context.read<RequestRepository>().requestList) {
              await getRequestInfoDetail(request).then((value) {
                context.read<RequestRepository>().reqeustDetailList.add(value!);
              });
            }
            context.read<MarkersRepository>().getMarker(context,context.read<RequestRepository>().requestList,context.read<RequestRepository>().reqeustDetailList);
          }
        });

        setState(() {
          mapController = controller;
        });
      },
      myLocationEnabled: true,
      initialCameraPosition: const CameraPosition(
        target: LatLng(34.771734704406896, 127.70199926332515),
        zoom: 15,
      ),
      myLocationButtonEnabled: true,
      markers: context.watch<MarkersRepository>().markers.values.toSet(),
    );
  }
}

