import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckBoxWithText extends StatefulWidget {
  CheckBoxWithText(
      {Key? key,
      required this.onCheck,
      required this.text,
      required this.isChecked})
      : super(key: key);
  final String text;

  bool isChecked;

  Function onCheck;

  @override
  State<CheckBoxWithText> createState() => _CheckBoxWithTextState();
}

class _CheckBoxWithTextState extends State<CheckBoxWithText> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value:  widget.isChecked,
          onChanged: (newValue) {
          setState(() {
            widget.isChecked = newValue! ;
            widget.onCheck(newValue);
          });

        }, ),
        Text(
          widget.text ,
          style:widget.isChecked ? Theme.of(context).textTheme.headlineSmall : Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).textTheme.headlineSmall!.color!.withOpacity(0.8)
          ),

        ),

      ],
    );



      CheckboxListTile(
      title:  Text(
        widget.text ,
        style:widget.isChecked ? Theme.of(context).textTheme.headlineSmall : Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Theme.of(context).textTheme.headlineSmall!.color!.withOpacity(0.8)
        ),

      ),
      value: widget.isChecked,
      onChanged: (newValue) {
        setState(() {
          widget.isChecked = newValue! ;
          widget.onCheck(newValue);
        });

      },
      visualDensity: VisualDensity.standard,
      contentPadding: EdgeInsets.zero,
      dense: true,
      // tristate: true,

      controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
    );
  }
}
