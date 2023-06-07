import 'package:flutter/cupertino.dart';

class ContentLabel extends StatelessWidget {
  String label = "";

  ContentLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),);
  }
}