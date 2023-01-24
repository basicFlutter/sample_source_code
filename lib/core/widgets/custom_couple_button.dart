import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomCoupleButton extends StatelessWidget {
  String rightButtonText;
  String leftButtonText;
  Function()? rightOnTab;
  Function()? leftOnTab;
  CustomCoupleButton(
      {Key? key,
      required this.rightButtonText,
      required this.leftButtonText,
      this.rightOnTab,
      this.leftOnTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _customCoupleButton(context);
  }

  Widget _customCoupleButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: CustomButton(
            onTab: leftOnTab,
            text: leftButtonText,
            textColor: Colors.black,
            buttonColor: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        Flexible(
          flex: 1,
          child: CustomButton(
              onTab: rightOnTab,
              text: rightButtonText,
            textColor: Colors.white,
            buttonColor: Theme.of(context).primaryColor,
             ),
        )
      ],
    );
  }
}
