import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  String name="";

  MyDrawer({required name});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(name),
                accountEmail: Text(""),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/AD_Test1.jpg'),
            ),
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)
                )
              ),
            ),
            Text("abcd"),
          ],
        ),
      ),
    );
  }

}