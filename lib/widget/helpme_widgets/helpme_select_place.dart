import 'package:flutter_geocoder/geocoder.dart';
import 'package:car_inspection/provider/helpme_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'helpme_page_pickup_place_map.dart';

class HelpMePickUpPlace extends StatefulWidget {
  bool? flag;

  HelpMePickUpPlace({required this.flag});

  @override
  State<StatefulWidget> createState() => HelpMePickUpPlaceState(flag: flag);
}

class HelpMePickUpPlaceState extends State<HelpMePickUpPlace> {
  bool? flag;

  HelpMePickUpPlaceState({required this.flag});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      enableInteractiveSelection: false,
      controller: controller,
      onTap: () async {
        LatLng? coord;
        var coordinates;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SelectPickupPlace()),
        ).then((value) => {
              coord = value,
              coordinates = Coordinates(coord!.latitude, coord!.longitude),
              Geocoder.local
                  .findAddressesFromCoordinates(coordinates)
                  .then((value) {
                if (value.first.countryCode == 'KR') {
                  String data = value.first.addressLine!.substring(5);
                  controller.text = data;
                  if (flag!) {
                    context.read<HelpMeRepository>().request_info.pickupPlace =
                        data;
                  } else {
                    context.read<HelpMeRepository>().request_info.returnPlace =
                        data;
                  }
                }
                ;
              }),
            });
      },
    );
  }
}
