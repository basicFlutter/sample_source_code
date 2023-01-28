import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return CheckboxListTile(

      title: Transform.translate(
        offset:  Offset(-19.w, 0),
        child: Text(widget.text),
      ),
      value: false,
      onChanged: (newValue) {  },
      visualDensity: VisualDensity.standard,
      contentPadding: EdgeInsets.zero,
      dense: true,
      tristate: true,

      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
  }
}
