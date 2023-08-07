
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/main.dart';
import '../utils/app_input_utils.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController inputController;

  final Function()? onTap;
  final int? maxLines;
  final bool? hasMoneyFormat;
  final bool? isRequired;
  final String? prefixText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLength;
  final bool? readOnly;
  final bool? hasEmailFormat;
  final Color? prefixIconColor;
  final bool? hasDifferentHeight;
  final TextInputType? keyboardType;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? labelStyle;
  final bool? isPhone;
  final String? hint;
  final String? confirmText;
  final bool? separator;
  final CustomText? suffixText;
  Function(String?)? validateFunction;
  Function(String)? onChange;
  final FocusNode? focusNode;
   Function()? completed;



  CustomInput(
      {Key? key,
        this.hasEmailFormat,
        this.suffixIcon,
        this.prefixText,
        this.maxLines,
        this.readOnly,
        this.prefixIcon,
        this.hasMoneyFormat,
        this.onTap,
        this.maxLength,
        this.hasDifferentHeight,
        this.keyboardType,
        this.isRequired,
        this.floatingLabelBehavior,
        this.labelStyle,
        this.prefixIconColor,
        required this.inputController,
        this.isPhone,
        this.hint,
        this.separator,
        this.suffixText,
       required this.validateFunction,
        this.focusNode,
        this.onChange,
        this.completed,
        this.confirmText
       })
      : super(key: key);

  String ? helper ;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (onFocusChange){

        if(completed != null && !onFocusChange){
          completed!();

        }

      },
      child: TextFormField( controller: inputController,
        focusNode: focusNode,
        onEditingComplete: (){
        // if(completed != null){
        // completed!();
        // }
          FocusScope.of(context).unfocus();
        },
        onTapOutside: (PointerDownEvent pointerDownEvent){

        },
        inputFormatters: (separator ?? false)
            ? [ThousandsSeparatorInputFormatter()]
            : null,
        readOnly: readOnly ?? false,
        onTap: onTap,
        maxLength: maxLength,
        keyboardType: keyboardType ?? TextInputType.text,
        autovalidateMode: AutovalidateMode.onUserInteraction,
       scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom*1.1),

        style:Theme.of(context).textTheme.labelSmall?.copyWith(
            fontVariations: [
              const FontVariation(
                  'wght', 500
              )
            ],
          letterSpacing: 0,
          color: Theme.of(context).primaryColor
        ),
        autocorrect: false,
        validator: hasEmailFormat ?? false
            ? (value) {

          final bool emailValid = RegExp(
              r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+")
              .hasMatch(value!);
          if (!emailValid) {
            helper = 'Invalid Email';
            validateFunction!("'Required'");
            return helper;
          }

          if (value == '') {
            validateFunction!("'Required'");
            return 'Required';
          } else {
            validateFunction!(null);
            return null;
          }
        }
            : (isPhone ??false)
            ? (value) {
          if (value!.length < 10) {
            validateFunction!('phone should be 10 digits');
            return 'Phone should be 10 Digits';
          }
          validateFunction!(null);
          return null;
        }
            : (value) {



          if (value?.trim() == '' && (isRequired ??false)) {
            validateFunction!("'Required'");
            return 'Required';
          }

          if(confirmText != null && confirmText != value){

            return "Confirmation Password is Wrong";

          }
          validateFunction!(null);
          return null;
        },

        maxLines: maxLines ?? 1,
        minLines: hasDifferentHeight ?? true ? null : 1,
        cursorColor: Theme.of(context).brightness == Brightness.light ? AppColors.orange :AppColors.orangeDark,

        decoration: InputDecoration(



            isDense: true,

           counterText: '',
         //   errorText: '',
            // helperStyle: Theme.of(context).inputDecorationTheme.helperStyle,
            prefixText: prefixText,
            suffixIcon: suffixIcon != null
                ? Icon(
              suffixIcon,
              color: Theme.of(context).inputDecorationTheme.suffixIconColor,
            )
                : null,
            prefixIcon: prefixIcon != null
                ? Icon(
              prefixIcon,
              color: Theme.of(context).inputDecorationTheme.prefixIconColor,
            )
                : hasMoneyFormat ?? false
                ?  Icon(
                Icons.attach_money,
                color: Theme.of(context).inputDecorationTheme.prefixIconColor,
              size: 16.h,

            )
                : null,

            suffix: inputController.text.trim() != ""? Padding(padding: EdgeInsets.only(right: 10.w), child: suffixText,) : null,

            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            enabledBorder:InputBorder.none,
            floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.never,



          hintText: hint,
            hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontVariations: [
                  FontVariation(
                      'wght', 400
                  )
                ],
                letterSpacing: 0,
              color: Theme.of(context).brightness == Brightness.light ?AppColors.secondary2.withOpacity(0.6) :AppColors.secondary2Dark
            ),
            errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
        ),
        onChanged: onChange,
      ),
    );
  }
}
