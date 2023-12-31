
import 'dart:io';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart' as encrypter;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_error_snackbar.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {


  static  Future<void> showCustomNotification({
    required BuildContext context,
    required MessageType messageType,
    required String message
  }) async {
    OverlayState? overlayState = Overlay.of(context);
   late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (c) {
        return Positioned(
          top: 40.h,
          left: 10.w,
          right: 10.w,
          child: Material(
            color: Colors.transparent,
            child: CustomErrorSnackBar(
              duration: 4,
              closeSnackBar: (){
                 overlayEntry.remove();

              },
              messageType: messageType, message: message,
            ),
          ),
        );
      },

    );


    overlayState.insert(overlayEntry);
    overlayState.setState(() {});

    // await Future.delayed(const Duration(seconds: 4));
    // overlayEntry.remove();
  }


  





  static Future<DateTime?> showCustomDialog(BuildContext context)async {
    DateTime date = DateTime.now();


  return await showGeneralDialog<DateTime?>(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Theme.of(context).brightness == Brightness.light ? AppColors.barrierColor : AppColors.barrierColorDark,
      transitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (_, __, ___) {
        return StatefulBuilder(
          builder: (context, setState){
            return Center(
              child:  CustomContainer(
                width: 250.w,
                height: 315.h,
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                child: Column(
                  children: [
                    SizedBox(
                      height:5.h ,
                    ),
                    Container(
                     // color: Colors.red,
                      width: 250.w,
                      height: 240.h,
                      child: CupertinoTheme(

                        data: CupertinoThemeData(
                          applyThemeToAll: true,
                          brightness: CupertinoTheme.of(context).brightness,

                          textTheme: CupertinoTextThemeData(
                              dateTimePickerTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                                fontVariations: [
                                  const FontVariation(
                                      'wght', 400
                                  )
                                ],
                                letterSpacing: 0,
                              ),




                          ),


                        ),

                        child: CupertinoDatePicker(

                          initialDateTime: date,
                          mode: CupertinoDatePickerMode.date,

                          use24hFormat: true,
                          // This shows day of week alongside day of month
                          showDayOfWeek: false,

                          // This is called when the user changes the date.
                          onDateTimeChanged: (DateTime newDate) {
                            date = newDate;

                           // setState(() => date = newDate);
                          },
                        ),
                      ),
                    ),

                    Container(
                      width: 220.w,
                      height: 1,
                      color: Theme.of(context).brightness == Brightness.light ? AppColors.deActive : AppColors.deActiveDark,
                    ),

                    SizedBox(
                      height:15.h ,
                    ),

                    Material(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(child: RoundCornerButton(
                            title: "Cancel",
                            isDeActive: true,
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            height: 40.h,
                            width:  105.5.w,
                          )),
                          SizedBox(
                            width: 9.w,
                          ),
                          Flexible(
                              child: RoundCornerButton(
                            title: "Save",

                            onTap: (){
                              Navigator.of(context).pop(date);
                            },
                            height: 40.h,
                            width:  105.5.w,
                          )),
                        ],
                      ),
                    )




                  ],
                ),
              ),
            );
          },
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(0, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(0, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );


  }

  static datePickerDialog({required BuildContext context}){
    DateTime date = DateTime(2016, 10, 26);
    DateTime time = DateTime(2016, 5, 10, 22, 35);
    DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

    // This function displays a CupertinoModalPopup with a reasonable fixed height
    // which hosts CupertinoDatePicker.
    showDialog(
        context: context,

        builder: (_) => CustomContainer(
          height: 311.h,
          width: 317.w,
          color: Colors.white,
          child: CupertinoDatePicker(
            initialDateTime: date,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            // This shows day of week alongside day of month
            showDayOfWeek: true,
            // This is called when the user changes the date.
            onDateTimeChanged: (DateTime newDate) {
              // setState(() => date = newDate);
            },
          ),
        ),
    );




  }



  static String encryptString({required String keyEncoder,required String value  }){
    final plainText = value;
    final key = encrypter.Key.fromUtf8(keyEncoder);
    final iv = encrypter.IV.fromLength(16);

    final encryptFunction = encrypter.Encrypter(encrypter.AES(key));

    final encryptedValue = encryptFunction.encrypt(plainText, iv: iv);
    // final decrypted = encrypt.decrypt(encrypted, iv: iv);
    return encryptedValue.base64;
  }

  static String decryptString({required String keyEncoder,required encrypter.Encrypted value  }){
    final plainText = value;
    final key = encrypter.Key.fromUtf8(keyEncoder);
    final iv = encrypter.IV.fromLength(16);

    final encryptFunction = encrypter.Encrypter(encrypter.AES(key));

    final encryptedValue = encryptFunction.decrypt(plainText, iv: iv);
    return encryptedValue;
  }

  static void sendForCall({required String phone}) async {
    await launchUrl(Uri.parse("tel://$phone"));
  }

  static void launchURL({required String url , required BuildContext context}) async {

    try{
      Uri webpageUrl = Uri.parse(url);
      if (!url.startsWith("http://") && !url.startsWith("https://")) {
         webpageUrl = Uri.parse("http://$url");
         if( ! await canLaunchUrl(webpageUrl)){
           webpageUrl = Uri.parse("https://$url");
         }
      }
      await launchUrl(webpageUrl);
    }catch(e){
      showCustomNotification(context: context, messageType: MessageType.error, message:'Could not launch $url' );
    }


  }




  static String dollarFormat(String number ) {
    if (number.length > 2) {
      number = number.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
    }

    return '\$ $number';
  }


  static Future<MultipartFile> getMultiPartFile ({required File file}) async{
    String fileName = file.path.split('/').last;
    return await MultipartFile.fromFile(file.path, filename:fileName);
  }


}
