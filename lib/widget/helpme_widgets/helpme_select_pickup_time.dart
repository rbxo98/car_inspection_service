import 'package:car_inspection/provider/helpme_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HelpMeSelectPickUpTime extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HelpMeSelectPickUpTimeState();
}

class HelpMeSelectPickUpTimeState extends State<HelpMeSelectPickUpTime> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
        readOnly: true,
        enableInteractiveSelection: false,
        controller: controller,
        onTap: () {
          showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.inputOnly,
                  cancelText: "취소",
                  confirmText: "확인",
                  helpText: "시간 선택",
                  hourLabelText: "시",
                  minuteLabelText: "분",
                  errorInvalidText: "올바른 시간이 아닙니다.")
              .then((value) {
            String data =
                "${value!.hour.toString().padLeft(2, "0")}시 ${value.minute.toString().padLeft(2, "0")}분";
            controller.text = data;
            context.read<HelpMeRepository>().time = value;
          });
        });
    //
  }
}
