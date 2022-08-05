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
      width: 65,
      height: 85.0,
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.green.shade700,
      selectedTextColor: Colors.white,
      dateTextStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: const TextStyle(
        fontSize: 15.5,
        fontWeight: FontWeight.bold,
      ),
      onDateChange: (date) {
        // New date selected
        setState(() {
                widget.dateTime = date;
          },
        );
      },
    );

  }
}
