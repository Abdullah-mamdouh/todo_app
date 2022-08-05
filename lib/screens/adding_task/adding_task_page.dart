import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/model/task.dart';
import 'package:todo/screens/adding_task/widget/deadline_button.dart';
import 'package:todo/screens/adding_task/widget/lable.dart';
import 'package:todo/screens/adding_task/widget/time.dart';
import 'package:todo/utils/shared_components/app_bar.dart';
import 'package:todo/utils/shared_components/button.dart';
import 'package:todo/utils/shared_components/my_divider.dart';

import '../../utils/blocs/app/cubit.dart';
import '../../utils/blocs/app/states.dart';
import '../../utils/shared_components/dropdown_button.dart';
import 'widget/textFeild.dart';

class AddingTaskPage extends StatefulWidget {
  const AddingTaskPage({Key? key}) : super(key: key);

  @override
  State<AddingTaskPage> createState() => _AddingTaskPageState();
}

class _AddingTaskPageState extends State<AddingTaskPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController remindController;
  late TextEditingController repeatController;
  TextEditingController? startController;
  TextEditingController? endController;
  TextEditingController? dateController;

  late List<String> remindItems;
  late List<String> repeatItems;
  TimeOfDay? time;

  @override
  void initState() {
    titleController = TextEditingController();
    dateController = TextEditingController();
    remindController = TextEditingController();
    repeatController = TextEditingController();
    startController = TextEditingController();
    endController = TextEditingController();
    remindItems = [
      '1 day before',
      '1 hour before',
      '30 min before',
      '10 min before'
    ];
    repeatItems = [
      'Daily',
      'Weekly',
      'Monthly',
      'Yearly',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    remindController.text = remindItems[0];
    repeatController.text = repeatItems[0];
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return BlocConsumer<AppBloc, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: h * 0.05,
                    ),
                    MyAppBar(title: "Add Task"),
                    SizedBox(height: 10),
                    MyDivider(),
                    SizedBox(height: 10),
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Lable(lable: 'Title'),
                            SizedBox(
                              height: 10,
                            ),
                            TextFieldClass(
                                controller: titleController,
                                hintText: 'Task Name'),
                            SizedBox(
                              height: 20,
                            ),
                            Lable(lable: 'Deadline'),
                            SizedBox(
                              height: 10,
                            ),
                            DeadlineButton(controller: dateController),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Time(
                                    title: 'Start time',
                                    controller: startController!),
                                Time(
                                    title: 'End time',
                                    controller: endController!),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Lable(lable: 'Remind'),
                            SizedBox(
                              height: 10,
                            ),
                            MyDropDownButton(
                              items: remindItems,
                              selectedValue: remindController,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Lable(lable: 'Repeat'),
                            SizedBox(
                              height: 10,
                            ),
                            MyDropDownButton(
                              items: repeatItems,
                              selectedValue: repeatController,
                            ),
                            SizedBox(
                              height: h * 0.1,
                            ),
                            Button(
                                text: 'Creat Task',
                                onClick: () {
                                  if (_formKey.currentState!.validate()) {
                                    AppBloc.get(context).insertTaskData(
                                        task: Task(
                                      title: titleController.text,
                                      date: dateController!.text,
                                      startTime: startController!.text,
                                      endTime: endController!.text,
                                      remind: remindController.text,
                                      repeat: repeatController.text,
                                      isCompleted: 0,
                                      isFavorite: 0,
                                    ));
                                  }
                                }),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
