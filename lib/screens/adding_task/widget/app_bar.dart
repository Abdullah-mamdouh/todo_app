
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        Align(
          child: Text('Add Task',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}
