
import 'package:flutter/material.dart';

import '../../../utils/shared_components/my_divider.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
