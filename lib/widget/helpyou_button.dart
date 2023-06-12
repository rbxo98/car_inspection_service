import 'package:car_inspection/provider/mycar_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../page/helpme_get_vehicle_registration_certificate_page.dart';
import '../page/helpme_page.dart';
import '../page/helpyou_page.dart';
import '../provider/helpme_repo.dart';
import '../provider/helpyou_repo.dart';

class HelpYouButton extends StatelessWidget {
  HelpYouButton() :super();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          "lib/assets/Helpyou.png",
          width: 150,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () async {
        if (false) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {}));
        }
        else {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MultiProvider(
                providers: [
                  ListenableProvider<RequestRepository>(create:(_)=>RequestRepository()),
                ],
              child: HelpYouPage(),);
            }));
        }
      },
    );
  }
}