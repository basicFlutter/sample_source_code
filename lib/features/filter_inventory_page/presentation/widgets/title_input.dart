import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/custom_text.dart';


class TitleInput extends StatefulWidget {
  const TitleInput({Key? key ,required this.title ,this.marginTop ,required this.child}) : super(key: key);
  final String title;
  final Widget? child;
  final double? marginTop ;

  @override
  State<TitleInput> createState() => _TitleInputState();
}

class _TitleInputState extends State<TitleInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox( height: widget.marginTop?? 0.h),
        CustomText(text: widget.title,
          textStyle: Theme.of(context).textTheme.displayLarge ,
          textFontWight: TextFontWight.semiBold,
          letterSpace: 0.05,

        ),
        if(widget.child != null)
        SizedBox( height: 8.h),
        if(widget.child != null) widget.child!
      ],
    );
  }
}
