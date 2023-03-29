import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage(
      {String? title,
      required String message,
      required BuildContext context,
      required bool isShowingError}) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        padding: EdgeInsets.all(10),
        backgroundColor: isShowingError
            ? Theme.of(context).errorColor
            : Theme.of(context).hintColor,
        content: Row(
          children: [
            Text(
              message,
             // style: AppStyles.body2,
            ),
          ],
        )));

    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.TOP,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: AppColors.titleColor.withOpacity(0.2),
    //   textColor: Colors.white,
    //   fontSize: 16.0,
    // );
  }

  static void sendForCall({required String phone}) async {
    await launchUrl(Uri.parse("tel://$phone"));
  }

  static void launchURL(String url) async => await canLaunchUrl(Uri.parse(url))
      ? await launchUrl(Uri.parse(url))
      : throw 'Could not launch $url';

  static sendMessage({required String phone}) async {
    // Android
    if (Platform.isAndroid) {
      var uri = 'sms:$phone';
      await launchUrl(Uri.parse(uri));
    } else if (Platform.isIOS) {
      // iOS
      var uri = 'sms:$phone';
      await launchUrl(Uri.parse(uri));
    }
  }

  static Color toColor(String color) {
    var hexColor = color.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }

    return Color(int.parse(hexColor));
  }

  static String dollarFormat(String number ) {
    if (number.length > 2) {
      number = number.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    }

    return '\$ $number';
  }

  // static copyToClipboard({required String text}) {
  //   Future<void> isOk = Clipboard.setData(ClipboardData(text: text));
  //   isOk.whenComplete(() => showMessage(message: 'success'));
  // }
}
