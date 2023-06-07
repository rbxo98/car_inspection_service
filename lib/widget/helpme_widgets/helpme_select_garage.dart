import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/helpme_repo.dart';

class HelpMeSelectGarage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HelpMeSelectGarageState();
}

class HelpMeSelectGarageState extends State<HelpMeSelectGarage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (s){context.read<HelpMeRepository>().request_info.garage=s;},
    );
  }
}