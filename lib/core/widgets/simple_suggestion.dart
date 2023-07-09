import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';

import 'package:new_panel/main.dart';


class SimpleSuggestion extends StatefulWidget {
  SimpleSuggestion({Key? key , required this.characters ,this.hint,required this.controller , required this.focusNode ,required this.suggestionsList , required this.textChanged});


    List<String> suggestionsList;
  Function(String?) textChanged;


  TextEditingController controller ;
  FocusNode focusNode;
  final String? hint;

  // TextEditingController _textEditingController = TextEditingController();
  String characters;

  @override
  State<SimpleSuggestion> createState() => _SimpleSuggestionState();
}

class _SimpleSuggestionState extends State<SimpleSuggestion> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,

      //    padding: EdgeInsets.only(left:  12.w,right: 12.w),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness== Brightness.light ? AppColors.input  : AppColors.inputDark,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),

        boxShadow: [

          Theme.of(context).brightness == Brightness.light ?AppColors.inputShadow :AppColors.inputShadowDark

        ],
      ),
      child: LayoutBuilder(

        builder: (context, constraints) => RawAutocomplete<String>(
          // focusNode: _focusNode,
          textEditingController: widget.controller,
          focusNode: widget.focusNode,

          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return  const Iterable<String>.empty();
            }
            return widget.suggestionsList.where((String option) {


              return option.toLowerCase().contains(textEditingValue.text.toLowerCase()) ;

            });
          },
          onSelected: (String city){


          },

          displayStringForOption: (String value) => value??"",


          fieldViewBuilder: (BuildContext context,
              TextEditingController textEditingController,
              FocusNode focusNode,
              VoidCallback onFieldSubmitted) {
            return TextFormField(
              controller: textEditingController,

              focusNode: focusNode,

              style:Theme.of(context).textTheme.labelSmall?.copyWith(
                fontVariations: [
                  FontVariation(
                      'wght', 500
                  )
                ],
                letterSpacing: 0,
                color: Theme.of(context).primaryColor

              ),
              scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom*2),
              decoration:  InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
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
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 12.w , top: 11.h)

              ),


              onChanged: (value) async{
                widget.characters = value.toLowerCase();
                widget.textChanged(value);
                _onChanged(value);
              },

            );
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<String> onSelected,
              Iterable<String> options) {
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
                        String suggestion = widget.suggestionsList[index];
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
                                        children: _getHighlightedTextSpans( widget.characters,suggestion,context),
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
    );
  }
}