import 'package:flutter/material.dart';
import 'package:todo/model/task.dart';
import 'package:todo/screens/board/widget/popup_menu_button.dart';
import 'package:todo/utils/constant_color/constant_colors.dart';
import 'package:todo/utils/shared_components/check_box.dart';

class TaskRow extends StatefulWidget {
  TaskRow({Key? key, required this.task}) : super(key: key);

  Task task;
  @override
  State<TaskRow> createState() => _TaskRowState();
}

class _TaskRowState extends State<TaskRow> {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /*Container(
          child: Icon(Icons.done, color: constantColors.baseColor),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(
              color: constantColors.primaryColor,
              width: 1.0,
            ),
          ),
        ),
        */
        MyCheckbox(task: widget.task),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Text(
            '${widget.task.title}',overflow: TextOverflow.fade,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ),
        MyPopupMenuButton(task: widget.task),
      ],
    );
  }
}
