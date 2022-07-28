
import 'package:flutter/material.dart';
import 'package:todo/model/task.dart';

import '../../../utils/blocs/app/cubit.dart';

class MyPopupMenuButton extends StatefulWidget {
  MyPopupMenuButton({Key? key, required this.task}) : super(key: key);
  Task task;

  @override
  State<MyPopupMenuButton> createState() => _MyPopupMenuButtonState();
}

class _MyPopupMenuButtonState extends State<MyPopupMenuButton> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: const [
              Icon(Icons.delete),
              SizedBox(
                width: 10,
              ),
              Text("Delete")
            ],
          ),
        ),
        // PopupMenuItem 2
        PopupMenuItem(
          value: 2,
          // row with two children
          child: Row(
            children: const [
              Icon(Icons.favorite),
              SizedBox(
                width: 10,
              ),
              Text("Favorite")
            ],
          ),
        ),
      ],
      color: Colors.white,
      elevation: 2,
      // on selected we show the dialog box
      onSelected: (value) {
        // if value 1 show dialog
        if (value == 1) {
          AppBloc.get(context).deleteData(id: widget.task.id!);
          // if value 2 show dialog
        }
        else if (value == 2) {
          Task updatedTask = Task(
            id: widget.task.id,
            date: widget.task.date,
            startTime: widget.task.startTime,
            endTime: widget.task.endTime,
            title: widget.task.title,
            isCompleted: widget.task.isCompleted,
            repeat: widget.task.repeat,
            remind: widget.task.remind,
            isFavorite: 1
          );
          AppBloc.get(context).updateTaskFavorite(isFavorite: 1, id: widget.task.id!);
          //AppBloc.get(context).updateTaskData( task: updatedTask,);
        }
      },
    );
  }
}
