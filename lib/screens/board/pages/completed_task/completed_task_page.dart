
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/task.dart';
import '../../../../utils/blocs/app/cubit.dart';
import '../../../../utils/blocs/app/states.dart';
import '../../../../utils/constant_color/constant_colors.dart';
import '../../widget/row_task.dart';


class CompletedTaskPage extends StatefulWidget {
  const CompletedTaskPage({Key? key}) : super(key: key);

  @override
  State<CompletedTaskPage> createState() => _CompletedTaskPageState();
}

class _CompletedTaskPageState extends State<CompletedTaskPage> {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.builder(
              itemCount: AppBloc.get(context).tasks.length,

              itemBuilder: (context, index) {
                List<Task> tasks = AppBloc.get(context).tasks;
                if(tasks[index].isCompleted == 1)
                {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: TaskRow(task: tasks[index]),
                  );
                }
                else return Container();
              });
        });
  }
}
