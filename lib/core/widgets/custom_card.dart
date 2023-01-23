import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';

class CustomCard extends StatelessWidget {
  final double? width;
  final Widget? content;
  final double? height;
  final Function()? onTap;
  final Color? cardColor;

  const CustomCard(
      {Key? key,
      this.width,
      this.cardColor,
      this.height,
      this.content,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Container(
          width: width ?? null,
          height: height ?? null,
          decoration: BoxDecoration(
            color: cardColor ?? Theme.of(context).scaffoldBackgroundColor,
            borderRadius:
                BorderRadius.all(Radius.circular(AppDimensions.buttonRadius)),
            border: Border.all( width :0.2 ,color: Theme.of(context).shadowColor),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor,
                blurRadius: 2,
                offset: Offset(2, 2), // Shadow position
              ),
            ],
          ),
          child: content ?? SizedBox(),
        ),
      ),
    );
  }
}
