import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget{
  String name="abceeeed";

  MyDrawer({required this.name});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(name),
                accountEmail: Text("abcdeee"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('lib/assets/profile.jpg'),
            ),
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)
                )
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("내 정보"),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text("진행 현황"),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("결제 수단"),
              onTap: (){
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("진행 내역"),
              onTap: (){
              },
            ),
          ],
        ),
      ),
    );
  }

}