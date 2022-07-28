
import 'package:flutter/material.dart';
import '../constant_color/constant_colors.dart';

class MyDropDownButton extends StatefulWidget {
  MyDropDownButton({Key? key, this.selectedValue, required this.items}) : super(key: key);
  TextEditingController? selectedValue;
  List<String> items;
  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  ConstantColors constantColors = ConstantColors();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //widget.selectedValue?.text = widget.items[0];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.black12,//constantColors.blackLight2,
        border: Border.all(width: 0.35,
          color: Colors.black12,//constantColors.whiteColor,
        ),
      ),
      child: ButtonTheme(
        alignedDropdown: true,
        //focusColor: constantColors.blackLight2,
        child: DropdownButton(
          underline: SizedBox(),
          borderRadius: BorderRadius.circular(20),
          value: widget.selectedValue!.text,
          dropdownColor: Colors.indigo[600],
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down,
            color: Colors.black26,//constantColors.whiteColor,
          ),
          items: widget.items.map((items) {
            return DropdownMenuItem(
                value: items,
                child: Text(
                  items,
                  style: TextStyle(
                      color: Colors.black26,//constantColors.whiteColor
                  ),
                ));
          }).toList(),
          onChanged: (String? value) {
            setState(() {
              this.widget.selectedValue!.text = value!;
              print(widget.selectedValue!.text.toString());
            });
          },
        ),
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
      ),
    );;
  }
}
