import 'dart:ui';

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text ;
  final TextStyle? textStyle;
  final TextFontWight? textFontWight;
  final bool? dollarSign;
  final bool? specialPrice;
  final bool? isShadow ;
  final Color? textColor;
  const CustomText({Key? key , required this.text , this.isShadow ,required this.textStyle, this.textFontWight , this.dollarSign , this.specialPrice , this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      (dollarSign ?? false) ? "\$$text":text ,
      style: textStyle?.copyWith(

          decoration: (specialPrice ?? false )? TextDecoration.lineThrough : null,
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

    );
  }
}


enum TextFontWight {
  regular,
  medium,
  semiBold,
  bold
}

