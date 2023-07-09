
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import '../utils/app_input_utils.dart';

class CustomInput extends StatefulWidget {
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
  final bool? separator;
  final CustomText? suffixText;


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
        this.suffixText
       })
      : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  String ? helper ;

  @override
  Widget build(BuildContext context) {
    return TextFormField( controller: widget.inputController,
      inputFormatters: (widget.separator ?? false)
          ? [ThousandsSeparatorInputFormatter()]
          : null,
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
     scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom*1.1),

      style:Theme.of(context).textTheme.labelSmall?.copyWith(
          fontVariations: [
            FontVariation(
                'wght', 500
            )
          ],
        letterSpacing: 0,
        color: Theme.of(context).primaryColor
      ),
      autocorrect: false,
      validator: widget.hasEmailFormat ?? false
          ? (value) {

        final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value!);
        if (!emailValid) {
          helper = 'invalid email';
          return helper;
        }
        if (value == '') {
          return 'Required';
        } else {
          return null;
        }
      }
          : widget.isRequired ?? false
          ? (widget.isPhone ??false)
          ? (value) {
        if (value!.length < 10) {
          return 'phone should be 10 digits';
        }
        return null;
      }
          : (value) {
        if (value == '') {
          return 'Required';

        }
        return null;
      }
          : (value) {
        return null;
      },
      maxLines: widget.maxLines ?? 1,
      minLines: widget.hasDifferentHeight ?? true ? null : 1,
      cursorColor: Theme.of(context).brightness == Brightness.light ? AppColors.orange :AppColors.orangeDark,

      decoration: InputDecoration(



          isDense: true,

         counterText: '',
       //   errorText: '',
          // helperStyle: Theme.of(context).inputDecorationTheme.helperStyle,
          prefixText: widget.prefixText,
          suffixIcon: widget.suffixIcon != null
              ? Icon(
            widget.suffixIcon,
            color: Theme.of(context).inputDecorationTheme.suffixIconColor,
          )
              : null,
          prefixIcon: widget.prefixIcon != null
              ? Icon(
            widget.prefixIcon,
            color: Theme.of(context).inputDecorationTheme.prefixIconColor,
          )
              : widget.hasMoneyFormat ?? false
              ?  Icon(
              Icons.attach_money,
              color: Theme.of(context).inputDecorationTheme.prefixIconColor,
            size: 16.h,

          )
              : null,

          suffix: widget.inputController.text.trim() != ""? Padding(padding: EdgeInsets.only(right: 10.w), child: widget.suffixText,) : null,

          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          enabledBorder:InputBorder.none,
          floatingLabelBehavior:
          widget.floatingLabelBehavior ?? FloatingLabelBehavior.never,



        hintText: widget.hint,
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
    );
  }
}
