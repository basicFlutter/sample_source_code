import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/widgets/back_textField.dart';
import 'package:new_panel/core/widgets/custom_input_with_label.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/main.dart';


class TextFieldWithBackWithLabel extends StatefulWidget {
  TextFieldWithBackWithLabel({Key? key,
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
    this.suffixText,
    this.label,
    this.formKey,
    this.usePassword,
    this.onTapSuffixIcon
  }) : super(key: key);

  final TextEditingController controller ;
  final TextInputType? textInputType;
  final int? maxLines;
  final bool? hasSeparator;
  final bool? isRequired;
  final String? prefixText;
  final String? hint;
  final String? label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLength;
  final bool? readOnly;
  final bool? isPhone;
  final bool? hasEmailFormat;
  final Color? prefixIconColor;
  final CustomText? suffixText;
  final GlobalKey<FormState>? formKey;
   bool? usePassword;
  Function()? onTapSuffixIcon;

  @override
  State<TextFieldWithBackWithLabel> createState() => _TextFieldWithBackWithLabelState();
}

class _TextFieldWithBackWithLabelState extends State<TextFieldWithBackWithLabel> {
  bool hasError = false;
  bool visiblePassword = false;

  final GlobalKey<BackTextFieldState> backTextFieldKey = GlobalKey<BackTextFieldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 71.h,
      //color: Colors.green,
      child: Stack(
        children: [
          BackTextField(
              key: backTextFieldKey,


              isRequired: widget.isRequired),
          // Container(
          //
          //   height: 45.h,
          //
          //   decoration: BoxDecoration(
          //   color: Theme.of(context).brightness== Brightness.light ? AppColors.input  : AppColors.inputDark,
          //     borderRadius: BorderRadius.all(Radius.circular(10.r)),
          //
          //     boxShadow: [
          //
          //       Theme.of(context).brightness == Brightness.light ?AppColors.inputShadow :AppColors.inputShadowDark,
          //
          //       if((widget.isRequired ?? false)&& (hasError))
          //       BoxShadow(
          //           color: Theme.of(context).brightness == Brightness.light ?AppColors.errorColor :AppColors.errorColorDark,
          //           spreadRadius: 0.1,
          //           offset: const Offset(0, 2))
          //     ],
          //   ),
          //
          //
          // ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(widget.prefixText!= null )
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
                  child: CustomInputWithLabel(
                    inputController: widget.controller,
                    hint: widget.hint,
                    keyboardType: widget.textInputType,
                    readOnly:widget.readOnly,
                    isPhone: widget.isPhone,
                    isRequired: widget.isRequired,
                    maxLines:widget.maxLines,
                    maxLength: widget.maxLength,
                    separator: widget.hasSeparator,
                    suffixText: widget.suffixText,
                    label: widget.label,
                    obscureText: widget.usePassword,
                    suffixIcon:  widget.suffixIcon,
                    hasEmailFormat: widget.hasEmailFormat,
                    suffixIconColor: (visiblePassword == false && widget.usePassword!=null) ? Theme.of(context).primaryColor : null,
                    onTapSuffixIcon: (){
                      if(widget.usePassword != null){
                        widget.usePassword = !widget.usePassword!;
                        visiblePassword = !visiblePassword;
                        setState(() {

                        });
                      }else if(widget.onTapSuffixIcon != null){
                        widget.onTapSuffixIcon!();
                      }
                    },
                    validateFunction: (validate)async{
                      if(validate != null){


                        hasError = true;
                        backTextFieldKey.currentState?.hasError= true;

                        Future.delayed(Duration.zero, () async {

                          backTextFieldKey.currentState?.setState(() {
                          });

                        });
                        // setState(() {
                        //
                        // });

                      }else{

                        hasError = false;
                        backTextFieldKey.currentState?.hasError= false;
                        Future.delayed(Duration.zero, () async {
                          backTextFieldKey.currentState?.setState(() {

                          });
                        });

                      }
                    },


                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// class TextFieldWithBackWithLabel extends StatefulWidget {
//   const TextFieldWithBackWithLabel({Key? key ,
//     required this.controller ,
//     this.textInputType,
//      this.suffixIcon,
//     this.maxLength,
//     this.readOnly,
//     this.hasEmailFormat,
//     this.hasSeparator,
//     this.isRequired,
//     this.maxLines,
//     this.prefixIcon,
//     this.prefixIconColor,
//     this.prefixText,
//     this.hint,
//     this.isPhone,
//     this.suffixText,
//     this.label,
//     this.formKey
//
//   }) : super(key: key);
//
//  final TextEditingController controller ;
//  final TextInputType? textInputType;
//   final int? maxLines;
//   final bool? hasSeparator;
//   final bool? isRequired;
//   final String? prefixText;
//   final String? hint;
//   final String? label;
//   final IconData? prefixIcon;
//   final IconData? suffixIcon;
//   final int? maxLength;
//   final bool? readOnly;
//   final bool? isPhone;
//   final bool? hasEmailFormat;
//   final Color? prefixIconColor;
//   final CustomText? suffixText;
//   final GlobalKey<FormState>? formKey;
//
//
//
//   @override
//   State<TextFieldWithBackWithLabel> createState() => _TextFieldWithBackWithLabelState();
// }
//
// class _TextFieldWithBackWithLabelState extends State<TextFieldWithBackWithLabel> {
//
//   bool hasError = false;
//   final GlobalKey<BackTextFieldState> backTextFieldKey = GlobalKey<BackTextFieldState>();
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: widget.formKey,
//       child: Container(
//         height: 67.h,
//         //color: Colors.green,
//         child: Stack(
//           children: [
//             BackTextField(
//                 key: backTextFieldKey,
//                 isRequired: widget.isRequired, hasError: hasError),
//             // Container(
//             //
//             //   height: 45.h,
//             //
//             //   decoration: BoxDecoration(
//             //   color: Theme.of(context).brightness== Brightness.light ? AppColors.input  : AppColors.inputDark,
//             //     borderRadius: BorderRadius.all(Radius.circular(10.r)),
//             //
//             //     boxShadow: [
//             //
//             //       Theme.of(context).brightness == Brightness.light ?AppColors.inputShadow :AppColors.inputShadowDark,
//             //
//             //       if((widget.isRequired ?? false)&& (hasError))
//             //       BoxShadow(
//             //           color: Theme.of(context).brightness == Brightness.light ?AppColors.errorColor :AppColors.errorColorDark,
//             //           spreadRadius: 0.1,
//             //           offset: const Offset(0, 2))
//             //     ],
//             //   ),
//             //
//             //
//             // ),
//             Container(
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if(widget.prefixText!= null )
//                   SizedBox(width: 12.w),
//                   if(widget.prefixText!= null )
//                     CustomText(text: widget.prefixText!,
//                       textStyle: Theme.of(context).textTheme.displayMedium,
//                       textFontWight: TextFontWight.semiBold,
//                       letterSpace: 0.5,
//                       textColor: Theme.of(context).primaryColor,
//                     ) ,
//                   if(widget.prefixText!= null )  SizedBox(width: 2.w),
//                   if(widget.hasSeparator??false)
//                     Icon( Icons.attach_money,
//                       color: Theme.of(context).primaryColor,
//                       size: 16.h,
//                     ),
//
//                   Expanded(
//                     child: CustomInputWithLabel(
//                       inputController: widget.controller,
//                       hint: widget.hint,
//                       keyboardType: widget.textInputType,
//                       readOnly: widget.readOnly,
//                       isPhone: widget.isPhone,
//                       isRequired: widget.isRequired,
//                       maxLines: widget.maxLines,
//                       maxLength: widget.maxLength,
//                       separator: widget.hasSeparator,
//                       suffixText: widget.suffixText,
//                       label: widget.label,
//                       validateFunction: (validate){
//                         if(validate != null){
//                           logger.w("aaa");
//                           hasError = true;
//                           backTextFieldKey.currentState?.widget.hasError= true;
//                           backTextFieldKey.currentState?.setState(() {
//
//                           });
//                           // setState(() {
//                           //
//                           // });
//                         }else{
//                           logger.w("bbb");
//                           hasError = false;
//                           backTextFieldKey.currentState?.widget.hasError= false;
//                           backTextFieldKey.currentState?.setState(() {
//
//                           });
//                         }
//                       },
//
//
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
