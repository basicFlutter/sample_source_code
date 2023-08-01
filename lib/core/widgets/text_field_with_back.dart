import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/back_textField.dart';
import 'package:new_panel/core/widgets/custom_input.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/icon_gradient.dart';


class TextFieldWithBack extends StatefulWidget {
   TextFieldWithBack({Key? key ,
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
    this.readOnlyText,
    this.onTap,
    this.height,
    this.completed,
     this.onChange,
     this.isValid,
     this.confirmText,
     this.hintReadOnly

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
  final String? readOnlyText;
  final String? confirmText;
  final GestureTapCallback? onTap;
  final double? height;
  Function()? completed;
  Function(String)? isValid;
  Function(String)? onChange;
  final String? hintReadOnly;


  @override
  State<TextFieldWithBack> createState() => _TextFieldWithBackState();
}

class _TextFieldWithBackState extends State<TextFieldWithBack> {
  bool hasError = false;
  final GlobalKey<BackTextFieldState> backTextFieldKey = GlobalKey<BackTextFieldState>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.height!= null ? widget.height!+13.h : 73.h,
        // color: Colors.green,
        child: Stack(
          children: [
            BackTextField(
                key: backTextFieldKey,
                heightTextField: widget.height != null ? widget.height!-15.h : null,
                isRequired: widget.isRequired
            ),
            // Container(
            //
            //   height: 45.h,
            //
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).brightness== Brightness.light ? AppColors.input  : AppColors.inputDark,
            //     borderRadius: BorderRadius.all(Radius.circular(10.r)),
            //
            //     boxShadow: [
            //
            //       Theme.of(context).brightness == Brightness.light ?AppColors.inputShadow :AppColors.inputShadowDark
            //
            //     ],
            //   ),
            //
            //
            // ),
            Padding(
              padding:  EdgeInsets.only(top: (widget.readOnly??false) ? 0 : 6.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(width: 12.w),
                  if(widget.prefixText!= null )
                    CustomText(text: widget.prefixText!,
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      textFontWight: TextFontWight.semiBold,
                      letterSpace: 0.5,
                      textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary  : AppColors.secondaryDark,
                    ) ,
                  if(widget.prefixText!= null )  SizedBox(width: 2.w),
                  if(widget.hasSeparator??false)
                    Icon( Icons.attach_money,
                      color: Theme.of(context).primaryColor,
                      size: 16.h,
                    ),

                  Expanded(
                    child: (widget.readOnly ?? false) ?
                    SizedBox(
                      height: 45.h,
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              CustomText(text:widget.readOnlyText!, textStyle: Theme.of(context).textTheme.labelSmall,
                               addSeparator: widget.hasSeparator,
                                textFontWight: TextFontWight.medium,
                                textColor: Theme.of(context).primaryColor,

                              ),
                              if(widget.readOnlyText == "" && widget.hintReadOnly!= null)
                                CustomText(text:widget.hintReadOnly!, textStyle: Theme.of(context).textTheme.labelSmall,
                                  addSeparator: widget.hasSeparator,
                                  textFontWight: TextFontWight.regular,
                                  textColor: Theme.of(context).brightness == Brightness.light ?AppColors.secondary2.withOpacity(0.6) :AppColors.secondary2Dark,

                                ),
                            ],
                          ),
                        ],
                      ),
                    ) :CustomInput(
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
                      suffixIcon: widget.suffixIcon,
                      hasEmailFormat: widget.hasEmailFormat,
                      completed: widget.completed,
                      onChange: widget.onChange,
                      confirmText: widget.confirmText,

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

                          if(widget.isValid != null){
                            widget.isValid!(widget.controller.text);
                          }


                        }
                      },


                    ),
                  ),

                  if(widget.suffixIcon != null)
                    IconGradient(iconSize: 24.r, icon: widget.suffixIcon!),
                  if(widget.suffixIcon != null)
                    SizedBox(width: 10.5.w,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
