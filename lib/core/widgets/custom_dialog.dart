import 'package:flutter/material.dart';

class CustomDialog {
  static Future<void> showLoadingDialog(
      {required BuildContext context, required Widget dialogContent}) async {
    return showDialog<void>(
        barrierColor: Colors.grey.withOpacity(0.5),
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            elevation: 4,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            contentPadding: EdgeInsets.all(5),
            content: dialogContent,
          );
        });
  }
}
