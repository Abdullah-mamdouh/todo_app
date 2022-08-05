import 'package:flutter/material.dart';

class TextFieldClass extends StatelessWidget {
  TextFieldClass({
    Key? key,
    @required this.controller,
    @required this.hintText,
  }) : super(key: key);
  final TextEditingController? controller;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      controller: controller,
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.black26,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Task Name';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(18),

        filled: true,
        fillColor: Colors.black12,
        hintText: '${hintText}',
        hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 1.5, color: Colors.black12),
        ),
      ),
    );
  }
}
