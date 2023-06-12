import 'package:car_inspection/models/request_info.dart';
import 'package:car_inspection/provider/mycar_repo.dart';
import 'package:car_inspection/provider/helpme_repo.dart';
import 'package:car_inspection/provider/user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../page/helpme_get_vehicle_registration_certificate_page.dart';
import '../page/helpme_page.dart';

class HelpMeButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          "lib/assets/Helpme.png",
          width: 150,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () async {
        await context.read<myCarRepository>().getMyCarFromSNSKey(context.read<UserRepository>().user.SNSKey!,ispermmit: true).then((value) {
          if(value!){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return ListenableProvider<HelpMeRepository>(create:(_)=>HelpMeRepository(),child: HelpMePage(),);
            }));
          }
          else{
            Fluttertoast.showToast(msg: "등록된 차량이 없습니다.");
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return GetVehicleRegistrationCertificate();
            }));
          }
        });
      },
    );
  }
}