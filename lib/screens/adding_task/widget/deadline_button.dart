
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeadlineButton extends StatefulWidget {
  DeadlineButton({Key? key, required this.controller}) : super(key: key);

  TextEditingController? controller;

  @override
  State<DeadlineButton> createState() => _DeadlineButtonState();
}

class _DeadlineButtonState extends State<DeadlineButton> {
  DateTime? date ;

  @override
  void initState() {
    date = DateTime.now();
    print(date.toString());
    widget.controller!.text = DateFormat('y-MM-d').format(date!);//
    //'${date!.hour} : ${date!.minute}  ${date!.period}';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        getDate(context);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${widget.controller!.text}',style: TextStyle(color: Colors.black26,),),
            Icon(Icons.keyboard_arrow_down,size: 35,color: Colors.black26,)
          ],
        ),
      ),
    );
  }

  getDate(BuildContext context) async{
    DateTime? date = await showDatePicker(
      context: context,
      initialDate:DateTime(2005),
      firstDate: DateTime(1973),
      lastDate: DateTime(2030),
    );
    print(date);
      setState(() {
        this.date = date;
        widget.controller!.text = DateFormat('y-MM-d').format(date!);
      });
  }
}
