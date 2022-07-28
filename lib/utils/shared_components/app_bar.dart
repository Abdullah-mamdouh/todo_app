
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({Key? key, required this.title}) : super(key: key);

  String title;
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
          child: Text('${title}',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }
}
