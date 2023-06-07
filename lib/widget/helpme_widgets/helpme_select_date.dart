import 'package:car_inspection/provider/helpme_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HelpMeSelectDate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HelpMeSelectDateState();
}

class HelpMeSelectDateState extends State<HelpMeSelectDate> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
        readOnly: true,
        enableInteractiveSelection: false,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2101));
          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            context.read<HelpMeRepository>().date = pickedDate;
            controller.text=formattedDate;
          }
        });
  }
}
