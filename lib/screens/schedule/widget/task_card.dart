
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:todo/utils/constant_color/constant_colors.dart';
import 'package:todo/utils/shared_components/check_box.dart';

import '../../../model/task.dart';

class TaskCard extends StatefulWidget {
  TaskCard({Key? key, required this.task}) : super(key: key);
  Task task;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      child: FadeInAnimation(
        child: Container(
          height: 70,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: constantColors.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.task.endTime.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: constantColors.baseColor),
                  ),
                  Text(
                    widget.task.title.toString(),
                    style: TextStyle(
                        fontSize: 16,
                        color: constantColors.baseColor),
                  ),
                ],
              ),
              MyCheckbox(task: widget.task)
              /*Container(
                child: Icon(Icons.done,
                    color: constantColors.baseColor),
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: constantColors.baseColor,
                    width: 1.0,
                  ),
                ),
              ),
              */
            ],
          ),
        ),
      ),
    );
  }
}
