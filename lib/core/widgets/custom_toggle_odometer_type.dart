import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/gradeint_text.dart';

class CustomToggleOdometerType extends StatelessWidget {
  CustomToggleOdometerType({Key? key , required this.odometerType, required this.onChange}) : super(key: key);
  OdometerType odometerType;
  Function(OdometerType odometerType) onChange;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(odometerType == OdometerType.km){
          odometerType = OdometerType.mile;
        }else{
          odometerType = OdometerType.km;
        }
        onChange(odometerType);
      },
      child: Container(
        width: 70.w,
        height: 24.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            color: Theme.of(context).brightness == Brightness.light ? AppColors.input :AppColors.inputDark,
            boxShadow: [
              Theme.of(context).brightness == Brightness.light ? AppColors.toggleButtonShadow: AppColors.toggleSwitchShadowDark
            ]
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:  EdgeInsets.only(left: 7.w),
                child: GradientText(
                  text: "KM",
                  textStyle: Theme.of(context).textTheme.displayMedium,
                  textFontWight: TextFontWight.regular,
                  gradient: Theme.of(context).brightness == Brightness.light ?AppColors.gradientBlue : AppColors.gradientBlueDark,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding:  EdgeInsets.only(right: 5.w),
                child: GradientText(
                  text: "Mile",
                  textStyle: Theme.of(context).textTheme.displayMedium,
                  textFontWight: TextFontWight.regular,
                  gradient: Theme.of(context).brightness == Brightness.light ?AppColors.gradientBlue : AppColors.gradientBlueDark,
                ),
              ),
            ),

            AnimatedAlign(
              alignment: odometerType == OdometerType.km ? Alignment.centerLeft : Alignment.centerRight,
              duration: const Duration(milliseconds: 150),
              child: Container(
                width: 36.w,
                height: 24.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark
                ),
                child: Center(
                  child: CustomText(
                    text: odometerType == OdometerType.km ? "KM" : "Mile",
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    textFontWight: TextFontWight.bold,
                    textColor: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

// class CustomToggleOdometerType extends StatefulWidget {
//    CustomToggleOdometerType({Key? key , required this.odometerType, required this.onChange}) : super(key: key);
//    OdometerType odometerType;
//    Function(OdometerType odometerType) onChange;
//   @override
//   State<CustomToggleOdometerType> createState() => _CustomToggleOdometerTypeState();
// }
//
// class _CustomToggleOdometerTypeState extends State<CustomToggleOdometerType> {
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (){
//         if(widget.odometerType == OdometerType.km){
//           widget.odometerType = OdometerType.mile;
//         }else{
//           widget.odometerType = OdometerType.km;
//         }
//         widget.onChange(widget.odometerType);
//         setState(() {
//
//         });
//       },
//       child: Container(
//         width: 70.w,
//         height: 24.h,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(10.r)),
//           color: Theme.of(context).brightness == Brightness.light ? AppColors.input :AppColors.inputDark,
//           boxShadow: [
//             Theme.of(context).brightness == Brightness.light ? AppColors.toggleButtonShadow: AppColors.toggleSwitchShadowDark
//           ]
//         ),
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Padding(
//                 padding:  EdgeInsets.only(left: 7.w),
//                 child: GradientText(
//                   text: "KM",
//                   textStyle: Theme.of(context).textTheme.displayMedium,
//                   textFontWight: TextFontWight.regular,
//                   gradient: Theme.of(context).brightness == Brightness.light ?AppColors.gradientBlue : AppColors.gradientBlueDark,
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Padding(
//                 padding:  EdgeInsets.only(right: 5.w),
//                 child: GradientText(
//                   text: "Mile",
//                   textStyle: Theme.of(context).textTheme.displayMedium,
//                   textFontWight: TextFontWight.regular,
//                   gradient: Theme.of(context).brightness == Brightness.light ?AppColors.gradientBlue : AppColors.gradientBlueDark,
//                 ),
//               ),
//             ),
//
//             AnimatedAlign(
//                 alignment: widget.odometerType == OdometerType.km ? Alignment.centerLeft : Alignment.centerRight,
//                 duration: const Duration(milliseconds: 150),
//               child: Container(
//                 width: 36.w,
//                 height: 24.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(10.r)),
//                   gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark
//                 ),
//                 child: Center(
//                   child: CustomText(
//                     text: widget.odometerType == OdometerType.km ? "KM" : "Mile",
//                     textStyle: Theme.of(context).textTheme.displayMedium,
//                     textFontWight: TextFontWight.bold,
//                     textColor: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
//                   ),
//                 ),
//               ),
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }
