
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RowDate extends StatelessWidget {
  RowDate({Key? key, required this.dateTime}) : super(key: key);
  DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat('EEEE').format(dateTime),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          DateFormat('d MMM,y').format(dateTime),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
