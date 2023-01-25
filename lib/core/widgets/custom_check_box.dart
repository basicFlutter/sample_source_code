import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final String? text;
  bool isChecked ;
  final Function onChecked ;
   CustomCheckBox({Key? key,required this.onChecked ,  this.text , required this.isChecked}) : super(key: key);

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
        Checkbox(value: widget.isChecked, onChanged: (value) {
          setState(() {
            widget.onChecked(value );
            widget.isChecked = value!;
          });
        })
      ],
    );


  }
}
