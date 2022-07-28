
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/screens/adding_task/widget/lable.dart';

class Time extends StatefulWidget {
  Time({Key? key, required this.title, required this.controller}) : super(key: key);
  String title;
  TextEditingController? controller;
  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {

  TimeOfDay? time ;

  @override
  void initState() {
    time = TimeOfDay.now();
    widget.controller!.text = //DateFormat("hh:mm a").format(time).toString();//
     '${time!.hour} : ${time!.minute}  ${time!.period.name}';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Lable(lable: widget.title),
        const SizedBox(height: 10,),
        GestureDetector(
          onTap: (){
            getTime(context);
          },
          child: Container(
            padding: EdgeInsets.all(16),width: w*0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${widget.controller!.text}',style: TextStyle(color: Colors.black26),),
                Icon(Icons.access_time_rounded,color: Colors.black26),
              ],
            ),
          ),
        ),
      ],
    );
  }

  getTime(BuildContext context) async {

    TimeOfDay? timeOfDay = await showTimePicker(context: context, initialTime: TimeOfDay.now(),);
    print (timeOfDay);
    //if (timeOfDay != null && timeOfDay != this.time)
      setState(() {
        this.time = timeOfDay;
        widget.controller!.text = '${time!.hour} : ${time!.minute} ${time!.period.name}';
      });

  }
}
