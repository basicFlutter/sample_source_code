import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class TitleInput extends StatefulWidget {
  const TitleInput({Key? key ,required this.title , required this.child}) : super(key: key);
  final String title;
  final Widget child;

  @override
  State<TitleInput> createState() => _TitleInputState();
}

class _TitleInputState extends State<TitleInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox( height: 35.h),
        CustomText(text: widget.title,
          textStyle: Theme.of(context).textTheme.labelLarge ,
          textFontWight: TextFontWight.semiBold,
          letterSpace: 0.05,

        ),
        SizedBox( height: 8.h),
        widget.child
      ],
    );
  }
}
