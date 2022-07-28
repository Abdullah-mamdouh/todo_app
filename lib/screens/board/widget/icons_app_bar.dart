
import 'package:flutter/material.dart';

import '../../../utils/constant_color/constant_colors.dart';

class IconsAppBar extends StatelessWidget {
  IconsAppBar({Key? key, required this.scaffoldKey}) : super(key: key);
  var scaffoldKey ;
  ConstantColors constantColors  = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(
            Icons.search_rounded,
            color: Colors.black,
          ),
          iconSize: 22,
          onPressed: () {},
        ),
        Stack(
          children: [
            IconButton(
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
              iconSize: 22,
              onPressed: () {},
            ),
            Positioned(
              right: 0,
              left: 10,
              top: 16,
              child: CircleAvatar(
                radius: 3,
                backgroundColor: constantColors.primaryColor,
              ),
            ),
          ],
        ),
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          iconSize: 22,
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
      ],
    );
  }
}
