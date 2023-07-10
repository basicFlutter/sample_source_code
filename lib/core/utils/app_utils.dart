
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage(
      {String? title,
      required String message,

      required BuildContext context,
     }) {
    return ScaffoldMessenger.of(context).showSnackBar(


        SnackBar(

          dismissDirection: DismissDirection.up,
        duration: const Duration(milliseconds: 1500),
        // padding: EdgeInsets.all(10),

        backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(
              bottom: 1.sh - 100,),
        elevation: 0,
        //     ? Theme.of(context).errorColor
        //     : Theme.of(context).brightness == Brightness.light ? AppColors.active : AppColors.activeDark,
        content:
        Container(
          width: 0.9.sw,
         // height: 65.h,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            boxShadow: [
              Theme.of(context).brightness == Brightness.light ? AppColors.boxShadowMenu : AppColors.boxShadowMenuDark
            ],
          ),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: BackdropFilter(

                filter: ImageFilter.blur(
                  sigmaX: 2.0,
                  sigmaY: 2.0,
                ),
                child: Material(
                  type: MaterialType.transparency,

                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light ? Colors.white.withOpacity(0.6) : AppColors.whiteDark.withOpacity(0.8),

                    ),
                    width: 0.9.sw,
                //    height: 65.h,

                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10.h),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [

                                if(title!=null)
                                SizedBox(
                                  width: 0.85.sw,
                                  child: CustomText(text: title,
                                    textStyle: Theme.of(context).textTheme.labelLarge ,
                                    textFontWight: TextFontWight.semiBold,
                                    // textColor: Theme.of(context).brightness == Brightness.light ? AppColors.active : AppColors.activeDark,
                                    textColor: Theme.of(context).primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                SizedBox(
                                  width: 0.85.sw,
                                  child: CustomText(text: message,
                                    textStyle: Theme.of(context).textTheme.labelSmall ,
                                    textFontWight: TextFontWight.semiBold,
                                    // textColor: Theme.of(context).brightness == Brightness.light ? AppColors.active : AppColors.activeDark,
                                //    textColor: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

    ));





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
