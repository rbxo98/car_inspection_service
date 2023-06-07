import 'package:car_inspection/provider/helpme_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/mycar_info.dart';
import '../../provider/mycar_repo.dart';

class HelpMeSelectMyCar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>HelpMeSelectMyCarState();

}

class HelpMeSelectMyCarState extends State<HelpMeSelectMyCar>{
  late MyCarInfo SelectedMyCar;
  @override
  Widget build(BuildContext context) {
    SelectedMyCar = context.read<myCarRepository>().myCars[0];
    context.read<HelpMeRepository>().request_info.myCarID=SelectedMyCar.id;
    return DropdownButtonFormField<MyCarInfo>(
      items:
      context.read<myCarRepository>().myCars.map((MyCarInfo items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items.name.toString()),
        );
      }).toList(),
      onChanged: (MyCarInfo? items) {
        context.read<HelpMeRepository>().request_info.myCarID=items!.id;
        setState(() {
          SelectedMyCar = items;
        });
      },
      value: SelectedMyCar,
      icon: const Icon(Icons.keyboard_arrow_down),
    );
  }

}