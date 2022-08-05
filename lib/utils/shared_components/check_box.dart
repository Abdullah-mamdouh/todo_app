
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo/utils/constant_color/constant_colors.dart';

import '../../model/task.dart';
import '../blocs/app/cubit.dart';

class MyCheckbox extends StatefulWidget {
  MyCheckbox({Key? key,required this.task}) : super(key: key);

  Task task ;
  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {

  ConstantColors constantColors = ConstantColors();
  late bool isCompleted ;
  @override
  void initState() {
    isCompleted = widget.task.isCompleted == 0? false : true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          isCompleted = !isCompleted;
          debugPrint(widget.task.toJson().toString());
          Task updatedTask = Task(
              id: widget.task.id,
              date: widget.task.date,
              startTime: widget.task.startTime,
              endTime: widget.task.endTime,
              title: widget.task.title,
              isCompleted: isCompleted ? 1 : 0,
              repeat: widget.task.repeat,
              remind: widget.task.remind,
              isFavorite: widget.task.isFavorite
          );
          AppBloc.get(context).updateTaskStatus(isCompleted: isCompleted ? 1 : 0, id: widget.task.id!);
         // AppBloc.get(context).updateTaskData( task: updatedTask,);
        });
      },
      child: Container(
        height: 30,width: 30,
        child: isCompleted ? Icon(Icons.done, color: constantColors.baseColor) : Container(),
        decoration: BoxDecoration(
          color: isCompleted ? constantColors.primaryColor : constantColors.baseColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
