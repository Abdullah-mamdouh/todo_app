
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:todo/utils/constant_color/constant_colors.dart';

import '../../../utils/shared_components/my_divider.dart';
import '../../adding_task/adding_task_page.dart';
import '../../schedule/schedule_page.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  ConstantColors constantColors  = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: constantColors.blackLight2,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: constantColors.baseColor),
            accountName: Text(
              //'${user!.name}'
              'Abdullah Mamdouh',style: TextStyle(fontSize: 16,color: Colors.black),
            ),
            accountEmail: Text(
              //'${user!.email}'
              "abdo@gmail.com",style: TextStyle(fontSize: 14,color: Colors.black),
            ),
            currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: constantColors.primaryColor,
                ),
                onTap: () {
                }),
          ),
          MyDivider(),

          ListTile(
            leading: Icon(Icons.account_circle_outlined,),
            title: Text("Profile",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            onTap: () async {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddingTaskPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(EvaIcons.home,),
            title: Text("Home",style:TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchedulePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
