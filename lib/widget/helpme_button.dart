import 'package:car_inspection/models/request_info.dart';
import 'package:car_inspection/provider/mycar_repo.dart';
import 'package:car_inspection/provider/helpme_repo.dart';
import 'package:car_inspection/provider/user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../page/add_mycar_page.dart';
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
      onTap: () {
        if (context
            .read<myCarRepository>()
            .myCars
            .isNotEmpty) {
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return ListenableProvider<HelpMeRepository>(create:(_)=>HelpMeRepository(),child: HelpMePage(),);
          }));
        }
        else {
          Navigator.push(context,MaterialPageRoute(builder: (context){
            return AddMyCarPage();
          }));
        }
      },
    );
  }
}