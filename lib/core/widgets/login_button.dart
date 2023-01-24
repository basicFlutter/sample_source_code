import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key , required this.onTap}) : super(key: key);
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
                  (states) => EdgeInsets.symmetric(vertical: 11.h , horizontal: 170.h),
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
          "Login",
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
