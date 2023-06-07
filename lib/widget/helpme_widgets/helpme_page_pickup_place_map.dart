import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectPickupPlace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SelectPickupPlaceState();
}

class SelectPickupPlaceState extends State<SelectPickupPlace> {
  late GoogleMapController? mapController;
  LatLng? coord;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Positioned(
          child: GoogleMap(
            onMapCreated: (controller) {
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
            onCameraMove: (value) {
              coord = value.target;
              print(coord);
            },
          ),
        ),
        Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 50),
                child: FloatingActionButton.extended(
                  label: Text("이 위치로 설정"),
                  onPressed: () {
                    Navigator.pop(context, coord);
                  },
                ),
              ),
            )),
        const Positioned(
            child: Align(
              alignment: Alignment(0, -0.05),
              child: Icon(
                Icons.push_pin,
                size: 50,
                color: Colors.blue,
              ),
            )),
      ]),
    );
  }
}