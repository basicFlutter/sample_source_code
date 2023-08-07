import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_loading.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/main.dart';


class RoundCornerButton extends StatefulWidget {

  final double width;
  final double height;

  final double? radius;
  final IconData ? icon;
  final String title;
  final TextStyle? textStyle;
  final TextFontWight? textFontWight;
  final GestureTapCallback onTap;
  final Gradient? gradientBackGround;
  final String? svgIconPath;
  final double? iconSize;
  final double? paddingBetweenIconAndText;
  final bool? isLoading;
  final Color? backGroundColor;
  final Color? textColor;
  final bool? hasShadow;
   bool? isDeActive;
   final bool? showUnderLineShadow;
   final bool? showTopLineShadow;

   RoundCornerButton({Key? key,this.textStyle,this.isDeActive,this.hasShadow,required this.onTap,this.textColor,this.backGroundColor,this.isLoading,this.paddingBetweenIconAndText ,this.iconSize ,this.svgIconPath,this.gradientBackGround,this.textFontWight,required this.width ,required this.title ,this.icon ,required this.height  , this.radius , this.showUnderLineShadow , this.showTopLineShadow}) : super(key: key);

  @override
  State<RoundCornerButton> createState() => RoundCornerButtonState();
}

class RoundCornerButtonState extends State<RoundCornerButton> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 10.r)),
            color:  widget.backGroundColor ?? ((widget.isDeActive ?? false) ? Theme.of(context).brightness == Brightness.light ? AppColors.secondary2 :AppColors.secondary2Dark : widget.backGroundColor),
            gradient: widget.backGroundColor== null && ((widget.isDeActive ?? false) == false) ? widget.gradientBackGround ??  (Theme.of(context).brightness == Brightness.light ? AppColors.gradientOrange : AppColors.gradientOrangeDark):null,

            boxShadow: [
              if(widget.showUnderLineShadow ?? false)
              BoxShadow(
                  color: Theme.of(context).colorScheme.primary,
                  spreadRadius: 0.1,
                  offset: const Offset(0, 1)),

              if(widget.showTopLineShadow ?? false)
                BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    spreadRadius: 0.1,
                    offset: const Offset(0, -1))

            ]
        ),
        // padding: EdgeInsets.only(top: 7.h , bottom: 8.h),
        child:Container(
          height: 13.h,
          // color: Colors.grey,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(widget.icon != null)
                Icon(
                  widget.icon ,
                  size: widget.iconSize ?? 12.r,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 1,
                      color: Colors.black.withOpacity(0.25),
                    ),
                  ] ,
                  color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
                ),
              if(widget.icon != null)
                SizedBox(width:widget.paddingBetweenIconAndText?? 1.w),
              if(widget.svgIconPath != null)
                SizedBox(
                    width: 22.r,
                    height: 22.r,
                    child: SvgPicture.asset(widget.svgIconPath!)),
              if(widget.svgIconPath != null)
                SizedBox(width: 6.w),
              if(widget.isLoading ?? false)
                 SizedBox(
                    height: widget.height*0.6,
                    child: const CustomLoading(lightColor: true,)),
              if((widget.isLoading ?? false) == false)
                 CustomText(
                  textFontWight: widget.textFontWight == null && (widget.isDeActive ?? false)== false ? TextFontWight.bold :  widget.textFontWight,
                  text: widget.title,
                  isShadow: widget.hasShadow ?? (widget.isDeActive ?? false) == false,
                  textColor:  widget.textColor == null && (widget.isDeActive ?? false)== false ? (Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark) :widget.textColor,
                  textStyle: widget.textStyle ?? Theme.of(context).textTheme.labelMedium)
            ],
          ),
        ),
      ),
    );
  }
}
