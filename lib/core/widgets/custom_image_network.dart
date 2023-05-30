import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/constants/constants.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/gradeint_text.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({Key? key , required this.url , this.boxFit , this.showAge , this.age}) : super(key: key);
  final String? url;
  final BoxFit? boxFit;
  final bool? showAge;
  final num? age;
  @override
  Widget build(BuildContext context) {
    return  url != null ?Stack(
      alignment: Alignment.center,
      children: [

        Image.network(
          Constants.cdnBaseUrl+url!,
          cacheWidth: 100,
          cacheHeight: 100,
          fit: boxFit ?? BoxFit.cover,
          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
            return const Center(
              child: Icon(Icons.error_outline),
            );
          },
        ),
        (age != null )? Align(
          alignment: Alignment.topLeft,
          child: Container(
            height: 19.h,
            margin: EdgeInsets.only(left: 15.w),
            padding: EdgeInsets.symmetric(vertical: 3.h ,horizontal: 0),
            decoration: BoxDecoration(
              boxShadow: [
              Theme.of(context).brightness == Brightness.light ? AppColors.boxShadow :AppColors.boxShadowDark
              ],
            color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,

              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.r) , bottomRight: Radius.circular(4.r))
            ),
            constraints: BoxConstraints(
              minWidth: 17.w,
              maxWidth: 37.w
            ),
            child: Center(
              child: GradientText(
                text: age!.toString(),
                textStyle: Theme.of(context).textTheme.bodyLarge,
                textFontWight: TextFontWight.bold,
                gradient: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark,
              ),
            ),

          ),
        ) : SizedBox() ,

      ],
    ) : const Center(
      child: Icon(Icons.error_outline),
    );
  }
}
