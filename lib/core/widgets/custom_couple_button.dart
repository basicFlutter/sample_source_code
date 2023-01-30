import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_panel/core/widgets/active_button.dart';
import 'package:new_panel/core/widgets/de_active_button.dart';



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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: DeActiveButton(
            onTap: leftOnTab!,
            title: leftButtonText,
            // textColor: Colors.black,
            // buttonColor: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        Flexible(
          flex: 1,
          child: ActiveButton(
              onTap: rightOnTab!,
              title: rightButtonText,
            // textColor: Colors.white,
            // buttonColor: Theme.of(context).primaryColor,
             ),
        )
      ],
    );
  }
}
