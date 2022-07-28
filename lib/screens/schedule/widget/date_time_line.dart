import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo/utils/constant_color/constant_colors.dart';

import '../../../utils/blocs/app/cubit.dart';
import '../../../utils/blocs/app/states.dart';

class DateTimeLine extends StatefulWidget {
  DateTimeLine({Key? key,// required this.dateController
  }) : super(key: key);
  //TextEditingController dateController;
  DateTime dateTime = DateTime.now();
  @override
  State<DateTimeLine> createState() => _DateTimeLineState();
}

class _DateTimeLineState extends State<DateTimeLine> {
  ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    //debugPrint(DateFormat('y-MM-d').format(widget.dateTime));
    return DatePicker(
        DateTime.now(),
        height: 100,
        width: 70,
        initialSelectedDate: DateTime.now(),
        selectionColor: constantColors.primaryColor,
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey),
        dayTextStyle: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey),
        onDateChange: (date) {
          setState(() {
            widget.dateTime = date;
            //widget.dateController.text = DateFormat('y-MM-d').format(widget.dateTime);
          });
        },
      );

  }
}
