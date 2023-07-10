
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import '../utils/app_input_utils.dart';

class CustomInputWithLabel extends StatefulWidget {
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
  final String? label;
  final bool? separator;
  final CustomText? suffixText;
  final bool? obscureText;
  FocusNode? focusNode ;
  Function(String?)? validateFunction;
  Function()? onTapSuffixIcon;
  final Color? suffixIconColor;



  CustomInputWithLabel(
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
        this.focusNode,
        this.label,
        this.obscureText,
        this.validateFunction,
        this.onTapSuffixIcon,
        this.suffixIconColor
      })
      : super(key: key);

  @override
  State<CustomInputWithLabel> createState() => _CustomInputWithLabelState();
}

class _CustomInputWithLabelState extends State<CustomInputWithLabel> {
  String ? helper ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 45.h,
      child: TextFormField(
        controller: widget.inputController,

        inputFormatters: widget.separator ?? false
            ? [ThousandsSeparatorInputFormatter()]
            : null,
        readOnly: widget.readOnly ?? false,
        onTap: widget.onTap,
        obscureText: widget.obscureText ?? false,
        obscuringCharacter: "*",
        maxLength: widget.maxLength,
        focusNode: widget.focusNode,
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
            color: Theme.of(context).primaryColor,

        ),
        autocorrect: false,
        validator: widget.hasEmailFormat ?? false
            ? (value) {

          final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!);
          if (!emailValid) {
            helper = 'invalid email';
            widget.validateFunction!("'Required'");
            return helper;
          }
          if (value == '') {
            widget.validateFunction!("'Required'");
            return 'Required';
          } else {
            widget.validateFunction!(null);
            return null;
          }
        }
            : widget.isRequired ?? false
            ? (widget.isPhone ??false)
            ? (value) {
          if (value!.length < 10) {
            widget.validateFunction!('phone should be 10 digits');
            return 'phone should be 10 digits';
          }
          widget.validateFunction!(null);
          return null;
        }
            : (value) {
          if (value == '') {
            widget.validateFunction!("'Required'");
            return 'Required';

          }
          widget.validateFunction!(null);
          return null;
        }
            : (value) {
          widget.validateFunction!(null);
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
              ? InkWell(
            onTap: widget.onTapSuffixIcon,
                child: Icon(
            widget.suffixIcon,
            color: widget.suffixIconColor ?? Theme.of(context).inputDecorationTheme.suffixIconColor,
          ),
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

          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)
          ),
          enabledBorder:const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)
          ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)
          ),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)
          ),
          focusColor: Colors.transparent,
          floatingLabelBehavior:
          widget.floatingLabelBehavior ?? FloatingLabelBehavior.auto,

          floatingLabelStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontVariations: [
                const FontVariation(
                    'wght', 400
                )
              ],
              letterSpacing: 0,
              color: Theme.of(context).primaryColor
          ),
          labelText: widget.label,
          labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontVariations: [
                const FontVariation(
                    'wght', 400
                )
              ],
              letterSpacing: 0,
              color: Theme.of(context).brightness == Brightness.light ?AppColors.secondary2.withOpacity(0.6) :AppColors.secondary2Dark
          ),




          hintText: widget.hint,
          hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontVariations: [
                const FontVariation(
                    'wght', 400
                )
              ],
              letterSpacing: 0,
              color: Theme.of(context).brightness == Brightness.light ?AppColors.secondary2.withOpacity(0.6) :AppColors.secondary2Dark
          ),
          errorStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontVariations: [
                const FontVariation(
                    'wght', 400
                )
              ],
              letterSpacing: 0,
              color: Theme.of(context).brightness == Brightness.light ? AppColors.errorColor : AppColors.errorColorDark,
              height: 0.05
          ),

        ),
      ),
    );
  }
}
