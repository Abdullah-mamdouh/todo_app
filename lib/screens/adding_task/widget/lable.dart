
import 'package:flutter/material.dart';

class Lable extends StatelessWidget {
  Lable({Key? key, required this.lable}) : super(key: key);

  String lable;

  @override
  Widget build(BuildContext context) {
    return Text('${lable}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w800),);
  }
}
