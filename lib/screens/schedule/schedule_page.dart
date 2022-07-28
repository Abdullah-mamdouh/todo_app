import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:todo/screens/schedule/widget/date_time_line.dart';
import 'package:todo/screens/schedule/widget/task_card.dart';
import 'package:todo/utils/constant_color/constant_colors.dart';
import 'package:todo/utils/shared_components/app_bar.dart';

import '../../model/task.dart';
import '../../utils/blocs/app/cubit.dart';
import '../../utils/blocs/app/states.dart';
import '../../utils/shared_components/my_divider.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  TextEditingController? _selectedDateTime;
  ConstantColors constantColors = ConstantColors();
  DateTime dateTime = DateTime.now();
  @override
  void initState() {
    _selectedDateTime = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: h * 0.03,
            ),
            MyAppBar(title: 'Schedule'),
            SizedBox(height: 10),
            // DateTimeLine(
            //     //dateController: _selectedDateTime!
            //     ),
            MyDivider(),
            SizedBox(height: 10),
            DatePicker(
              DateTime.now(),
              height: 100,
              width: 70,
              initialSelectedDate: DateTime.now(),
              selectionColor: constantColors.primaryColor,
              selectedTextColor: Colors.white,
              dateTextStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,),
              dayTextStyle: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,),
              monthTextStyle: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,),
              onDateChange: (date) {
                setState(() {
                  dateTime = date;
                  //widget.dateController.text = DateFormat('y-MM-d').format(widget.dateTime);
                });
              },
            ),
            MyDivider(),
            SizedBox(height: 10),
            /////////////////
            //SizedBox(height: 10),
            BlocConsumer<AppBloc, AppStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Expanded(
                      child: ListView.builder(
                      itemCount: AppBloc.get(context).tasks.length,
                      itemBuilder: (context, index) {
                      List<Task> tasks = AppBloc.get(context).tasks;

                      if (tasks[index].repeat!.compareTo('Daily') == 0) {
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            child: TaskCard(
                              task: tasks[index],
                            ));
                      }

                      debugPrint('${DateFormat('y-MM-d').format(dateTime)}');

                      if (tasks[index].date ==
                          DateFormat('y-MM-d').format(dateTime)) {
                        //debugPrint(_selectedDateTime.toString().toString());
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            child: TaskCard(
                              task: tasks[index],
                            ));
                      } else {
                        return Container(
                          height: 0,
                          width: 0,
                        );
                      }
                    },
                  ));
                })
          ],
        ),
      ),
    );
  }
}
