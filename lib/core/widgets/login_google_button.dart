import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginGoogleButton extends StatelessWidget {
  const LoginGoogleButton({Key? key , required this.onTap}) : super(key: key);
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 48.h,
      width: 380.w,
      child: ElevatedButton(
        autofocus: false,
        onPressed: onTap,

        style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith<EdgeInsets>(
                  (states) => EdgeInsets.symmetric(vertical: 11.h , horizontal: 90.5.h),
            ),
            elevation: MaterialStateProperty.resolveWith<double?>(
                  (states) => 0,
            ),

            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)){
                    return Theme.of(context).colorScheme.tertiary;
                  }
                  return Theme.of(context).colorScheme.tertiary; // Defer to the widget's default.
                }
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/ic_google.svg" ,
              color: Theme.of(context).colorScheme.onTertiary,
              width: 24.w,
              height: 24.w,
            ),

            SizedBox(
              width: 8.w,
            ),
            Text(
              "Continue With Google",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiary,
                  fontSize: 16.sp,
                  fontFamily: "PublicSans",
                  fontWeight: FontWeight.w700
              ),

            ),
          ],
        ),),
    );
  }
}
