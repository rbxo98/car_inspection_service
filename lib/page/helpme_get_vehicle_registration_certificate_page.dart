import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'helpme_get_mycar_info_page.dart';

class GetVehicleRegistrationCertificate extends StatelessWidget {
  final ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetVehicleRegistrationCertificateAppBar(),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("차량 등록증을 촬영하여 업로드"),
            IconButton(onPressed: () async{
              await picker
                  .pickImage(source: ImageSource.camera)
                  .then((value)  {
                print(value!.path);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return GetMyCarInfo(image: value,);
                    }));
              });
            }, icon: Icon(Icons.photo_camera)),

            Text("또는 갤러리에서 선택"),
            IconButton(
                onPressed: () async {
                  await picker
                      .pickImage(source: ImageSource.gallery)
                      .then((value) => {
                    print(value),
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return GetMyCarInfo(image: value!);
                        })),
                  });
                },
                icon: Icon(Icons.collections)),
          ],
        ),
      ),
    );
  }
}


class GetVehicleRegistrationCertificateAppBar extends AppBar {
  GetVehicleRegistrationCertificateAppBar()
      : super(
    toolbarHeight: 60,
    backgroundColor: Color.fromRGBO(250, 250, 250, 1),
    iconTheme: IconThemeData(color: Colors.black),
    elevation: 0,
    title: const Text("차량 등록"),
    centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.black),
  );
}
