import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDividerWithText extends StatelessWidget {
  final String text ;
  const CustomDividerWithText({Key? key , required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 22.h,
      child: Row(children: <Widget>[
        Expanded(
          child:  Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: Divider(
                color: Theme.of(context).dividerColor,
                height: 36,
              )),
        ),
        Text(text , style: Theme.of(context).textTheme.headlineSmall),
        Expanded(
          child:  Container(
              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Divider(
                color: Theme.of(context).dividerColor,
                height: 36,
              )),
        ),
      ]),
    );
  }
}
