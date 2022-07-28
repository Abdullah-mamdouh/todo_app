import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/adding_task/adding_task_page.dart';
import 'package:todo/screens/board/pages/all_tasks/all_tasks_page.dart';
import 'package:todo/screens/board/pages/completed_task/completed_task_page.dart';
import 'package:todo/screens/board/pages/favorite_task/favorite_task_page.dart';
import 'package:todo/screens/board/pages/uncompleted_task/uncompleted_task_page.dart';
import 'package:todo/screens/board/widget/icons_app_bar.dart';
import 'package:todo/screens/board/widget/tab_bar.dart';
import 'package:todo/screens/schedule/schedule_page.dart';
import 'package:todo/utils/constant_color/constant_colors.dart';

import '../../utils/shared_components/my_divider.dart';
import 'widget/my_drawer.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    TabController? controller;
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: constantColors.baseColor,
        drawer: MyDrawer(),
        appBar: AppBar(
          toolbarHeight: 90.0,
          backgroundColor: constantColors.baseColor,
          elevation: 0,
          title: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Board',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          actions: <Widget>[
            IconsAppBar(scaffoldKey: scaffoldKey),
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: MyTabBar()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TabBarView(
            controller: controller,
            children: [
              AllTasksPage(),
              CompletedTaskPage(),
              UnCompletedTaskPage(),
              FavoriteTaskPage(),
            ],
          ),
        ),
      ),
    );
  }

  appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Column(
          children: [
            MyDivider(),
            TabBar(
              isScrollable: true,
              padding: EdgeInsets.only(bottom: 0),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 5.0),
                  insets: EdgeInsets.symmetric(horizontal: 12.0)),
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "All",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Completed",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "UnCompleted",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Favorite",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            MyDivider(),
          ],
        ));
  }
}
