import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/main.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomText extends StatelessWidget {
  final String text ;
  final TextStyle? textStyle;
  final TextFontWight? textFontWight;
  final bool? dollarSign;
  final bool? specialPrice;
  final bool? isShadow ;
  final Color? textColor;
  final bool? addSeparator;
  final double? letterSpace;
  final double? wordSpace;
  final bool? multiLine;
  final bool? hyperLink;

  const CustomText({Key? key ,this.addSeparator ,this.multiLine ,this.letterSpace,required this.text , this.isShadow ,required this.textStyle, this.textFontWight , this.dollarSign , this.specialPrice , this.textColor , this.hyperLink , this.wordSpace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:hyperLink != null ? () async{
        if(hyperLink ?? false){


            AppUtils.launchURL(url: text , context: context);


        }
      }:null,
      child: Text(
       ( addSeparator ?? false )? (dollarSign ?? false) ? "\$${NumberFormat.decimalPattern().format(text.contains(RegExp(r"\d+\.\d+",caseSensitive: false)) ? double.parse(text):int.parse(text))}":NumberFormat.decimalPattern().format(text.contains(RegExp(r"\d+\.\d+",caseSensitive: false)) ? double.parse(text):int.parse(text)):
        (dollarSign ?? false) ? "\$$text":text ,
        overflow: (multiLine ?? false)? TextOverflow.visible:TextOverflow.ellipsis,
        // textScaleFactor: 1.0,
        style: textStyle?.copyWith(

         letterSpacing: letterSpace ??0,
            wordSpacing: wordSpace,
            decoration: (specialPrice ?? false )? TextDecoration.lineThrough : (hyperLink ?? false ) ?TextDecoration.underline: null,
             color: textColor ?? textStyle?.color,
             fontVariations:textFontWight != null ? [
                  FontVariation(
              'wght',
              textFontWight == TextFontWight.regular ? 400 :
              textFontWight == TextFontWight.medium ? 500 :
              textFontWight == TextFontWight.semiBold ? 600 :
              textFontWight == TextFontWight.bold ? 700 :
              400
          )
        ]: textStyle?.fontVariations,

          shadows:(isShadow ?? false) ? <Shadow>[
            Shadow(
              offset: const Offset(0, 1),
              blurRadius: 1,
              color: Colors.black.withOpacity(0.25),
            ),
          ] : null,
      ),

      ),
    );
  }
}


enum TextFontWight {
  regular,
  medium,
  semiBold,
  bold
}

