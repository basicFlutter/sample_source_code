import 'package:flutter/material.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

class GradientText extends StatelessWidget {
  const GradientText({Key? key , required this.text , required this.gradient ,this.specialPrice , this.dollarSign , this.textFontWight, this.textStyle}) : super(key: key);
  final String text ;
  final TextStyle? textStyle;
  final TextFontWight? textFontWight;
  final bool? dollarSign;
  final bool? specialPrice;
  final Gradient gradient;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        blendMode: BlendMode.srcIn,

        shaderCallback: (bounds) => gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),

        child: CustomText(text: text,
          textStyle: textStyle,
          textFontWight: textFontWight,
          dollarSign: dollarSign,
          specialPrice: specialPrice,
        )
    );
  }
}
