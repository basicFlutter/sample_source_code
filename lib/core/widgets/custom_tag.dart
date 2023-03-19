import 'package:flutter/material.dart';

import '../constants/app_dimensions.dart';
import '../constants/app_styles.dart';

class CustomTag extends StatelessWidget {
  final String tagString;
  final IconData? icon;
  final Function() onTap;
  final bool? isActive;

  const CustomTag(
      {Key? key,
      this.isActive,
      this.icon,
      required this.tagString,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: _tag(context));
  }

  Widget _tag(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Text(
              tagString,
              // style: AppStyles.body2.copyWith(
              //   color: isActive ?? false
              //       ? Theme.of(context).backgroundColor
              //       : Theme.of(context).primaryColor,
              // ),
            )),
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Icon(
                  icon,
                  size: AppDimensions.smallIcon,
                  color: isActive ?? false
                      ? Theme.of(context).backgroundColor
                      : Theme.of(context).primaryColor,
                ),
              )
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(AppDimensions.radiusAvatar)),
          color: isActive ?? false
              ? Theme.of(context).primaryColor
              : Theme.of(context).shadowColor),
    );
  }
}
