import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final String? text;
  bool isChecked ;
   CustomCheckBox({Key? key, this.text , required this.isChecked}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (widget.text != null)
          Text(widget.text!, style: Theme.of(context).textTheme.headlineMedium),
        Checkbox(value: widget.isChecked, onChanged: (val) {
          setState(() {
            widget.isChecked = val!;
          });
        })
      ],
    );


  }
}
