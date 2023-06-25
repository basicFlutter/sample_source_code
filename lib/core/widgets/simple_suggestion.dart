import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/main.dart';


class SimpleSuggestion extends StatelessWidget {
  SimpleSuggestion({Key? key , required this.characters ,required this.controller , required this.focusNode ,required this.suggestionsList , required this.textChanged});


  final  List<String> suggestionsList;
  Function(String?) textChanged;


  TextEditingController controller ;
  FocusNode focusNode;

  // TextEditingController _textEditingController = TextEditingController();
  String characters;
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
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w400,overflow: TextOverflow.fade,)
        ),


        );
      }

      // Add the matching text with highlighting
      spans.add(
        TextSpan(
            text: text.substring(index, index + searchQuery.length),
            style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w400 , color: Theme.of(context).brightness == Brightness.light ? AppColors.orange :AppColors.orangeDark,overflow: TextOverflow.fade,)
        ),
      );

      start = index + searchQuery.length;
      index = lowerCaseText.indexOf(lowerCaseSearchQuery, start);
    }

    // Add the remaining non-matching text
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start, text.length) ,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w400 , overflow: TextOverflow.fade,)

      ));
    }

    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,

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
          textEditingController: controller,
          focusNode: focusNode,

          optionsBuilder: (TextEditingValue textEditingValue) {
            if (textEditingValue.text == '') {
              return  Iterable<String>.empty();
            }
            return suggestionsList.where((String option) {

              return option.contains(textEditingValue.text.toLowerCase());



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
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor
              ),
              scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom*1.1),
              decoration:  InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 12.w , top: 11.h)

              ),


              onChanged: (value){
                characters = value;
                textChanged(value);

              },

            );
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<String> onSelected,
              Iterable<String> options) {
            return Align(
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
                    padding: EdgeInsets.only(top: 0),

                    separatorBuilder: (_, __) => Container(height: 1,
                        color: Theme.of(context).brightness == Brightness.light ? AppColors.deActive: AppColors.deActiveDark

                    ),
                    itemBuilder: (BuildContext context, int index) {
                      String suggestion = suggestionsList[index];
                      return Container(
                        height: 44.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: RichText(
                                text: TextSpan(
                                  children: _getHighlightedTextSpans( characters,suggestion,context),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },

                    itemCount: suggestionsList.length,
                  )
              ),
            );
          },
        ),
      ),
    );
  }
}