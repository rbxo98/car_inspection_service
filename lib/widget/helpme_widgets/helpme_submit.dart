import 'package:car_inspection/provider/helpme_repo.dart';
import 'package:car_inspection/provider/user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpMeSubmitButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: ElevatedButton(
          child: Text(
            "신청하기",
            style: TextStyle(fontSize: 15),
          ),
          onPressed: () {
            var date=context.read<HelpMeRepository>().date;
            var time=context.read<HelpMeRepository>().time;
            context.read<HelpMeRepository>().request_info.pickupTime=
                DateTime(date!.year,date.month,date.day,time!.hour,time.hour).toIso8601String();
            context.read<HelpMeRepository>().request_info.SNSKey=context.read<UserRepository>().user.SNSKey;
            print(context.read<HelpMeRepository>().request_info.toJson().toString());
            context.read<HelpMeRepository>().postRequest().then((value) => {if(value)Navigator.pop(context)});
          },
        ));
  }

}