
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({Key? key,required this.text,required this.onClick}) : super(key: key);
  String text ;
  Function onClick;
  //ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return ElevatedButton(

      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(18),
        shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(20.0),
      ),),
      child: Center(
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
      ),),onPressed: ()=> onClick(),);
  }

}
