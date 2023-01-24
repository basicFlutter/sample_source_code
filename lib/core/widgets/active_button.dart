import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveButton extends StatelessWidget {
  const ActiveButton({Key? key , required this.onTap , required this.title}) : super(key: key);
  final GestureTapCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 178.w,
      child: ElevatedButton(
        autofocus: false,
        onPressed: onTap,

        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith<EdgeInsets>(
                (states) => EdgeInsets.symmetric(vertical: 11.h , horizontal: 69.h),
          ),
            elevation: MaterialStateProperty.resolveWith<double?>(
                  (states) => 0,
                ),

            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)){
                    return Theme.of(context).colorScheme.primary;
                  }
                  return Theme.of(context).colorScheme.primary; // Defer to the widget's default.
                }
            )
        ),
        child: Text(
        title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 15.sp,
              fontFamily: "PublicSans",
              fontWeight: FontWeight.w700
          ),

      ),),
    );
  }
}