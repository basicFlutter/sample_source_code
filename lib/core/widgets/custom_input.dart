
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/app_dimensions.dart';
import '../utils/app_input_utils.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController inputController;
  final String label;
  final int? maxLines;
  final Function()? onTap;
  final bool? hasMoneyFormat;
  final bool? isRequired;
  final String? prefixText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLength;
  final bool? readOnly;
  final bool? hasEmailFormat;
  final bool? hasDifferentHeight;
  final TextInputType? keyboardType;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? labelStyle;
  final Color? prefixIconColor;

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
        required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextFormField( controller: inputController,
        inputFormatters: hasMoneyFormat == true ?? false
            ? [ThousandsSeparatorInputFormatter()]
            : null,
        readOnly: readOnly ?? false,
        onTap: onTap ?? null,
        maxLength: maxLength,
        keyboardType: keyboardType ?? TextInputType.text,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style:Theme.of(context).textTheme.headlineSmall,
        validator: hasEmailFormat ?? false
            ? (value) {
          final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!);
          if (!emailValid) {
            return 'invalid email';
          }
          if (value == '') {
            return '$label is required';
          } else {
            return null;
          }
        }
            : isRequired ?? false
            ? label == 'phone'
            ? (value) {
          if (value!.length < 10) {
            return 'phone should be 10 digits';
          }
          return null;
        }
            : (value) {
          if (value == '') {
            return '$label is required';
          }
          return null;
        }
            : (value) {
          return null;
        },
        maxLines: maxLines ?? 1,
        minLines: hasDifferentHeight ?? true ? null : 1,
        decoration: InputDecoration(

          // constraints: BoxConstraints(maxHeight: 330 , minHeight: 50),
          counterText: '',
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
              ? const Icon(Icons.attach_money)
              : null,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          border: Theme.of(context).inputDecorationTheme.border,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          floatingLabelBehavior:
          floatingLabelBehavior ?? FloatingLabelBehavior.auto,
          label: Text(
            isRequired ?? false ? '* $label' : label,
            style:Theme.of(context).inputDecorationTheme.labelStyle
          ),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
          fillColor: Theme.of(context).inputDecorationTheme.fillColor
          ),
        ),
    );
  }
}
