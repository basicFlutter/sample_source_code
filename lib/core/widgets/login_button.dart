import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatefulWidget {


  final GestureTapCallback onTap;
  final bool? isLoading ;
  final String text ;
  const CustomButton({Key? key , required this.onTap , required this.text , this.isLoading }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {


  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 48.h,
      width: 380.w,
      child: ElevatedButton(

        autofocus: false,
        onPressed: widget.onTap,

        style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith<EdgeInsets>(
                  (states) => EdgeInsets.symmetric(vertical: 11.h , horizontal: 150.h),
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
        child:widget.isLoading ??false  ?
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text(
                widget.text ,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 15.sp,
                    fontFamily: "PublicSans",
                    fontWeight: FontWeight.w700
                ),

              ) ,
              const SizedBox(width: 5,),
              SizedBox(
                  width: 15,
                  height: 15,
                  child: CircularProgressIndicator(color: Theme.of(context).backgroundColor,))
            ],)
            :  Text(
          widget.text ,
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
