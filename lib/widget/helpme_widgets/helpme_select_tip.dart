import 'package:car_inspection/provider/helpme_repo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpMeSelectTip extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HelpMeSelectTipState();
}

class HelpMeSelectTipState extends State<HelpMeSelectTip> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      onChanged: (s){context.read<HelpMeRepository>().request_info.serviceCharge=int.parse(s);},
    );
  }
}