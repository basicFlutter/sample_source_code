import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/models/suggestionModel.dart';
import 'package:new_panel/core/widgets/back_textField.dart';
import 'package:new_panel/core/widgets/custom_input.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/icon_gradient.dart';

import 'package:new_panel/main.dart';


class SuggestionWithCustomModel extends StatefulWidget {
  SuggestionWithCustomModel({Key? key ,
    required this.characters ,
    this.isRequired,
    this.hint,
    required this.controller ,
    required this.focusNode ,
    required this.suggestionsList,
    required this.textChanged,
    this.textInputType,
    this.suffixIcon,
    this.maxLength,
    this.readOnly,
    this.hasEmailFormat,
    this.hasSeparator,
    this.maxLines,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixText,
    this.isPhone,
    this.suffixText,
    this.readOnlyText,
    this.onTap,
    this.height
  });


    List<SuggestionModel> suggestionsList;
  Function(String?) textChanged;


  TextEditingController controller ;
  FocusNode focusNode;
  final String? hint;

  // TextEditingController _textEditingController = TextEditingController();
  String characters;

  final bool? isRequired;


  final TextInputType? textInputType;
  final int? maxLines;
  final bool? hasSeparator;
  final String? prefixText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLength;
  final bool? readOnly;
  final bool? isPhone;
  final bool? hasEmailFormat;
  final Color? prefixIconColor;
  final CustomText? suffixText;
  final String? readOnlyText;
  final GestureTapCallback? onTap;
  final double? height;

  @override
  State<SuggestionWithCustomModel> createState() => _SuggestionWithCustomModelState();
}

class _SuggestionWithCustomModelState extends State<SuggestionWithCustomModel> {
  List<TextSpan> _getHighlightedTextSpans(String searchQuery , String text, BuildContext context) {
    List<TextSpan> spans = [];

    if (searchQuery.isEmpty) {
      spans.add(TextSpan(text: text , style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w400,overflow: TextOverflow.fade,) ));
      return spans;
    }

    String lowerCaseText = text.toLowerCase();
    String lowerCaseSearchQuery = searchQuery.toLowerCase();

    int start = 0;
    int index = lowerCaseText.indexOf(lowerCaseSearchQuery);

    while (index != -1) {
      // Add the preceding non-matching text
      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index) ,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontVariations: [
                const FontVariation(
                    'wght', 500
                )
              ],
              letterSpacing: 0,
              overflow: TextOverflow.fade,)
        ),


        );
      }

      // Add the matching text with highlighting
      spans.add(
        TextSpan(
            text: text.substring(index, index + searchQuery.length),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontVariations: [
              const FontVariation(
                  'wght', 600
              )
            ],
              letterSpacing: 0,
            color: Theme.of(context).brightness == Brightness.light ? AppColors.orange :AppColors.orangeDark,overflow: TextOverflow.fade,)
        ),
      );

      start = index + searchQuery.length;
      index = lowerCaseText.indexOf(lowerCaseSearchQuery, start);
    }

    // Add the remaining non-matching text
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start, text.length) ,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontVariations: [
              const FontVariation(
                  'wght', 500
              ),
            ],
            letterSpacing: 0,
            overflow: TextOverflow.fade,)

      ));
    }

    return spans;
  }


  void _onChanged(String text) async {


    compare(a, b) {
      String match = widget.controller.text.toLowerCase();
      int aMatch = a.toLowerCase().indexOf(match);
      int bMatch = b.toLowerCase().indexOf(match);
      return aMatch.compareTo(bMatch);
    }

    widget.suggestionsList.sort(compare);
    widget.suggestionsList = widget.suggestionsList.reversed.toList();

    setState(() {

    });
  }
  final GlobalKey<BackTextFieldState> backTextFieldKey = GlobalKey<BackTextFieldState>();
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height:  73.h,
      // color: Colors.green,
      child: Stack(
        children: [
          BackTextField(
              key: backTextFieldKey,
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
            padding:  EdgeInsets.only(top: 6.h),
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
                        CustomText(text:widget.readOnlyText!, textStyle: Theme.of(context).textTheme.labelSmall,
                          addSeparator: widget.hasSeparator,
                          textFontWight: TextFontWight.medium,
                          textColor: Theme.of(context).primaryColor,

                        ),
                      ],
                    ),
                  ) :LayoutBuilder(

                    builder: (context, constraints) => RawAutocomplete<SuggestionModel>(
                      // focusNode: _focusNode,
                      textEditingController: widget.controller,
                      focusNode: widget.focusNode,


                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return  const Iterable<SuggestionModel>.empty();
                        }
                        return widget.suggestionsList.where((SuggestionModel option) {


                          return option.title.toLowerCase().contains(textEditingValue.text.toLowerCase()) ;

                        });
                      },
                      onSelected: (SuggestionModel suggestionSelected){


                      },

                      displayStringForOption: (SuggestionModel value) => value.title??"",


                      fieldViewBuilder: (BuildContext context,
                          TextEditingController textEditingController,
                          FocusNode focusNode,
                          VoidCallback onFieldSubmitted) {
                        return CustomInput(
                          inputController: textEditingController,
                          focusNode: focusNode,
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
                          onChange: (value) async{
                          widget.characters = value.toLowerCase();
                          widget.textChanged(value);
                          _onChanged(value);
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

                        );

                        //   TextFormField(
                        //   controller: textEditingController,
                        //
                        //   focusNode: focusNode,
                        //
                        //   style:Theme.of(context).textTheme.labelSmall?.copyWith(
                        //       fontVariations: [
                        //         FontVariation(
                        //             'wght', 500
                        //         )
                        //       ],
                        //       letterSpacing: 0,
                        //       color: Theme.of(context).primaryColor
                        //
                        //   ),
                        //   scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom*2),
                        //   decoration:  InputDecoration(
                        //       isDense: true,
                        //       border: InputBorder.none,
                        //       hintText: widget.hint,
                        //       hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        //           fontVariations: [
                        //             FontVariation(
                        //                 'wght', 400
                        //             )
                        //           ],
                        //           letterSpacing: 0,
                        //           color: Theme.of(context).brightness == Brightness.light ?AppColors.secondary2.withOpacity(0.6) :AppColors.secondary2Dark
                        //       ),
                        //       floatingLabelBehavior: FloatingLabelBehavior.never,
                        //       focusedBorder: InputBorder.none,
                        //    //   contentPadding: EdgeInsets.only(left: 12.w , top: 11.h)
                        //
                        //   ),
                        //
                        //
                        //   onChanged: (value) async{
                        //     widget.characters = value.toLowerCase();
                        //     widget.textChanged(value);
                        //     _onChanged(value);
                        //   },
                        //
                        // );
                      },
                      optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<SuggestionModel> onSelected,
                          Iterable<SuggestionModel> options) {
                        return Padding(
                          padding:  EdgeInsets.only(top: 8.h),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                                height: 134.h,
                                width: 358.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                    color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
                                    boxShadow: [
                                      AppColors.boxShadow
                                    ]
                                ),

                                // width: Get.width*0.4,
                                child:ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.only(top: 0),

                                  separatorBuilder: (_, __) => Container(height: 0.5,
                                      margin: EdgeInsets.symmetric(horizontal: 15.w),
                                      color: Theme.of(context).brightness == Brightness.light ? AppColors.deActive: AppColors.deActiveDark

                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    SuggestionModel suggestion = widget.suggestionsList[index];
                                    return Material(
                                      child: InkWell(
                                        onTap: (){
                                          onSelected(suggestion);
                                        },

                                        child: Container(
                                          height: 44.h,
                                          width: 358.w,
                                          color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,


                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:  EdgeInsets.only(left: 25.w),
                                                child: RichText(
                                                  text: TextSpan(
                                                    children: _getHighlightedTextSpans( widget.characters,suggestion.title,context),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },

                                  itemCount: widget.suggestionsList.length,
                                )
                            ),
                          ),
                        );
                      },
                    ),
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
    );



    //   Container(
    //   height: 45.h,
    //
    //
    //   //    padding: EdgeInsets.only(left:  12.w,right: 12.w),
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
    //   child: LayoutBuilder(
    //
    //     builder: (context, constraints) => RawAutocomplete<String>(
    //       // focusNode: _focusNode,
    //       textEditingController: widget.controller,
    //       focusNode: widget.focusNode,
    //
    //       optionsBuilder: (TextEditingValue textEditingValue) {
    //         if (textEditingValue.text == '') {
    //           return  const Iterable<String>.empty();
    //         }
    //         return widget.suggestionsList.where((String option) {
    //
    //
    //           return option.toLowerCase().contains(textEditingValue.text.toLowerCase()) ;
    //
    //         });
    //       },
    //       onSelected: (String city){
    //
    //
    //       },
    //
    //       displayStringForOption: (String value) => value??"",
    //
    //
    //       fieldViewBuilder: (BuildContext context,
    //           TextEditingController textEditingController,
    //           FocusNode focusNode,
    //           VoidCallback onFieldSubmitted) {
    //         return TextFormField(
    //           controller: textEditingController,
    //
    //           focusNode: focusNode,
    //
    //           style:Theme.of(context).textTheme.labelSmall?.copyWith(
    //             fontVariations: [
    //               FontVariation(
    //                   'wght', 500
    //               )
    //             ],
    //             letterSpacing: 0,
    //             color: Theme.of(context).primaryColor
    //
    //           ),
    //           scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom*2),
    //           decoration:  InputDecoration(
    //               isDense: true,
    //               border: InputBorder.none,
    //               hintText: widget.hint,
    //               hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
    //                   fontVariations: [
    //                     FontVariation(
    //                         'wght', 400
    //                     )
    //                   ],
    //                   letterSpacing: 0,
    //                   color: Theme.of(context).brightness == Brightness.light ?AppColors.secondary2.withOpacity(0.6) :AppColors.secondary2Dark
    //               ),
    //               floatingLabelBehavior: FloatingLabelBehavior.never,
    //               focusedBorder: InputBorder.none,
    //               contentPadding: EdgeInsets.only(left: 12.w , top: 11.h)
    //
    //           ),
    //
    //
    //           onChanged: (value) async{
    //             widget.characters = value.toLowerCase();
    //             widget.textChanged(value);
    //             _onChanged(value);
    //           },
    //
    //         );
    //       },
    //       optionsViewBuilder: (BuildContext context,
    //           AutocompleteOnSelected<String> onSelected,
    //           Iterable<String> options) {
    //         return Padding(
    //           padding:  EdgeInsets.only(top: 8.h),
    //           child: Align(
    //             alignment: Alignment.topLeft,
    //             child: Container(
    //                 height: 134.h,
    //                 width: 358.w,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.all(Radius.circular(8.r)),
    //                     color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
    //                     boxShadow: [
    //                       AppColors.boxShadow
    //                     ]
    //                 ),
    //
    //                 // width: Get.width*0.4,
    //                 child:ListView.separated(
    //                   physics: const BouncingScrollPhysics(),
    //                   padding: const EdgeInsets.only(top: 0),
    //
    //                   separatorBuilder: (_, __) => Container(height: 0.5,
    //                       margin: EdgeInsets.symmetric(horizontal: 15.w),
    //                       color: Theme.of(context).brightness == Brightness.light ? AppColors.deActive: AppColors.deActiveDark
    //
    //                   ),
    //                   itemBuilder: (BuildContext context, int index) {
    //                     String suggestion = widget.suggestionsList[index];
    //                     return Material(
    //                       child: InkWell(
    //                         onTap: (){
    //                           onSelected(suggestion);
    //                         },
    //
    //                         child: Container(
    //                           height: 44.h,
    //                           width: 358.w,
    //                           color: Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
    //
    //
    //                           child: Column(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               Padding(
    //                                 padding:  EdgeInsets.only(left: 25.w),
    //                                 child: RichText(
    //                                   text: TextSpan(
    //                                     children: _getHighlightedTextSpans( widget.characters,suggestion,context),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     );
    //                   },
    //
    //                   itemCount: widget.suggestionsList.length,
    //                 )
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}