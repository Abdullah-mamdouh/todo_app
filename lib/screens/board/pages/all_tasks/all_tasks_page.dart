import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/screens/board/widget/row_task.dart';
import 'package:todo/utils/constant_color/constant_colors.dart';

import '../../../../model/task.dart';
import '../../../../utils/blocs/app/cubit.dart';
import '../../../../utils/blocs/app/states.dart';

class AllTasksPage extends StatefulWidget {
  const AllTasksPage({Key? key}) : super(key: key);

  @override
  State<AllTasksPage> createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage> {
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
                return Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: TaskRow(task: tasks[index]),
                );
              });
        });
  }
}
