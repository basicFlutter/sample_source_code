import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_input.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class TextFieldWithBack extends StatefulWidget {
  const TextFieldWithBack({Key? key ,
    required this.controller ,
    this.textInputType,
     this.suffixIcon,
    this.maxLength,
    this.readOnly,
    this.hasEmailFormat,
    this.hasSeparator,
    this.isRequired,
    this.maxLines,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixText,
    this.hint,
    this.isPhone,
    this.suffixText
  }) : super(key: key);

 final TextEditingController controller ;
 final TextInputType? textInputType;
  final int? maxLines;
  final bool? hasSeparator;
  final bool? isRequired;
  final String? prefixText;
  final String? hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLength;
  final bool? readOnly;
  final bool? isPhone;
  final bool? hasEmailFormat;
  final Color? prefixIconColor;
  final CustomText? suffixText;

  @override
  State<TextFieldWithBack> createState() => _TextFieldWithBackState();
}

class _TextFieldWithBackState extends State<TextFieldWithBack> {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 38.h,

      decoration: BoxDecoration(
      color: Theme.of(context).brightness== Brightness.light ? AppColors.input  : AppColors.inputDark,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),

        boxShadow: [

          Theme.of(context).brightness == Brightness.light ?AppColors.inputShadow :AppColors.inputShadowDark

        ],
      ),
      child:
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

             SizedBox(width: 12.w),
          if(widget.prefixText!= null )
            CustomText(text: widget.prefixText!,
            textStyle: Theme.of(context).textTheme.displayMedium,
            textFontWight: TextFontWight.semiBold,
              letterSpace: 0.5,
              textColor: Theme.of(context).primaryColor,
          ) ,
          if(widget.prefixText!= null )  SizedBox(width: 2.w),
          if(widget.hasSeparator??false)
            Icon( Icons.attach_money,
              color: Theme.of(context).primaryColor,
              size: 16.h,
            ),

          Expanded(
            child: CustomInput(
              inputController: widget.controller,
              hint: widget.hint,
              keyboardType: widget.textInputType,
              readOnly: widget.readOnly,
              isPhone: widget.isPhone,
              isRequired: widget.isRequired,
              maxLines: widget.maxLines,
              maxLength: widget.maxLength,
              separator: widget.hasSeparator,
              suffixText: widget.suffixText,


            ),
          )
        ],
      ),
    );
  }
}
