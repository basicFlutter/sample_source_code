import 'package:flutter/material.dart';

class CheckBoxWithText extends StatefulWidget {
   CheckBoxWithText({Key? key , required this.text , required this.isChecked}) : super(key: key);
  final String text;
  bool isChecked ;
  @override
  State<CheckBoxWithText> createState() => _CheckBoxWithTextState();
}

class _CheckBoxWithTextState extends State<CheckBoxWithText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Checkbox(
            value: widget.isChecked,
            activeColor: Colors.green,

            onChanged: (newValue) {
              setState(() {
                widget.isChecked = newValue!;
              });
            }
        ),
        TextButton(onPressed: (){}, child: Text(widget.text))
      ],
    );
  }
}
