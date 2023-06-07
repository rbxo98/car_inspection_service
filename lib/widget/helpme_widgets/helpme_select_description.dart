import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/helpme_repo.dart';

class HelpMeSelectDescription extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HelpMeSelectDescriptionState();
}

class HelpMeSelectDescriptionState extends State<HelpMeSelectDescription> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
        onChanged: (s){context.read<HelpMeRepository>().request_info.description=s;},
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      maxLines: 10,
      minLines: 10,
    );
  }
}