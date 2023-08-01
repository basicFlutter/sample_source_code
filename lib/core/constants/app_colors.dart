import 'package:flutter/material.dart';

class AppColors {

  static const Color primary = Color(0xff01458C);
  static const Color primaryDark = Color(0xff01458C);
  static const Color primary2 = Color(0xff3E6A9D);
  static const Color primary3 = Color(0xffE0F0FA);
  static const Color primary3Dark = Color(0xffE0F0FA);

  static const Color secondary = Color(0xff000A32);
  static const Color secondaryDark = Color(0xff000A32);
  static const Color secondary2 = Color(0xffC9D2DA);
  static const Color secondary2Dark = Color(0xffC9D2DA);
  static const Color secondary3 = Color(0xff898989);
  static const Color secondary3Dark = Color(0xff898989);
  static const Color secondary4 = Color(0xff1F2C39);
  static const Color secondary4Dark = Color(0xff1F2C39);
  static const Color borderButtonColor = Color(0xff0382C1);
  static const Color borderButtonColorDark = Color(0xff0382C1);


  static const Color black = Color(0xff000000);
  static const Color blackDark = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  static const Color whiteDark = Color(0xffFFFFFF);
  static const Color active = Color(0xff67F051);
  static const Color activeDark = Color(0xff67F051);
  static const Color deActive = Color(0xffC9D2DA);
  static const Color deActiveDark = Color(0xffC9D2DA);
  static const Color input = Color(0xffF7F9F9);
  static const Color inputDark = Color(0xffF7F9F9);
  static const Color orange = Color(0xffFF8147);
  static const Color orangeDark = Color(0xffFF8147);
  static const Color backgroundCard = Color(0xffFEFEFE);
  static const Color backgroundCardDark = Color(0xffECF0F1);
  static  Color barrierColor = Colors.black.withOpacity(0.2);
  static  Color barrierColorDark =  Colors.black.withOpacity(0.2);
  static  Color customGreen =   const Color(0xff06A9A2);
  static  Color customGreenDark =  const Color(0xff06A9A2);


  // static const Color errorLighter = Color(0xffFFE7D9);
  // static const Color errorLighterDark = Color(0xffFFE7D9);
  //
  // static const Color errorDarker = Color(0xff7A0C2E);
  // static const Color errorDarkerDark = Color(0xff7A0C2E);



  static const Color successfulColor = Color(0xff00DF80);
  static const Color successfulColorDark = Color(0xff00DF80);

  static const Color errorColor = Color(0xffFF0000);
  static const Color errorColorDark = Color(0xffFF0000);

  static const Color warningColor = Color(0xffFFD21E);
  static const Color warningColorDark = Color(0xffFFD21E);

  static const Color informationColor = Color(0xff007DFF);
  static const Color informationColorDark = Color(0xff007DFF);

  static  Shadow shadow = Shadow(
    blurRadius: 4,
    offset: const Offset(0, 1),
    color: Colors.black.withOpacity(0.14)
  );

  static BoxShadow boxShadow = BoxShadow(
    color: Colors.black.withOpacity(0.14),
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, 1),
  );

  static BoxShadow boxShadowMenu =  BoxShadow(
    color: Colors.black.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 9,
    offset: const Offset(0, 2),
  );
  static BoxShadow boxShadowMenuDark =  BoxShadow(
    color: Colors.black.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 9,
    offset: const Offset(0, 2),
  );

  static BoxShadow toggleButtonShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 2,
    offset: const Offset(0, 2),
  );
  static BoxShadow toggleButtonShadowDark = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    spreadRadius: 0,
    blurRadius: 2,
    offset: const Offset(0, 2),
  );



  static BoxShadow inputShadow = BoxShadow(
    color: Colors.black.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 2,
    offset: const Offset(0, 1),
  );
  static BoxShadow inputShadowDark = BoxShadow(
    color: Colors.black.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 2,
    offset: const Offset(0, 1),
  );

  static BoxShadow boxShadowDark = BoxShadow(
    color: Colors.black.withOpacity(0.14),
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, 1),
  );

  static BoxShadow boxShadowInventory = BoxShadow(
    color: Colors.black.withOpacity(0.14),
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, 3),
  );
  static BoxShadow boxShadowInventoryDark = BoxShadow(
    color: Colors.black.withOpacity(0.14),
    spreadRadius: 0,
    blurRadius: 4,
    offset: const Offset(0, 3),
  );

  static BoxShadow toggleSwitchShadow = BoxShadow(
    color: Colors.black.withOpacity(0.25),
    spreadRadius: 0,
    blurRadius: 6,
    offset: const Offset(2, 1),
  );

  static BoxShadow toggleSwitchShadowDark = BoxShadow(
    color: Colors.black.withOpacity(0.25),
    spreadRadius: 3,
    blurRadius: 8,
    offset: const Offset(2, 1),
  );

  static List<BoxShadow> switchShadow = [

    BoxShadow(
      color: Colors.black.withOpacity(0.1),
    ),
    const BoxShadow(
      color: AppColors.white,
      spreadRadius: -3.0,
      blurRadius: 8,
      offset: Offset(0, 6)
    ),

  ];
  static List<BoxShadow> switchShadowDark = [

    BoxShadow(
      color: Colors.black.withOpacity(0.1),
    ),
    const BoxShadow(
        color: AppColors.white,
        spreadRadius: -3.0,
        blurRadius: 8,
        offset: Offset(0, 6)
    ),

  ];


  static const Color hint = Color(0xffFFF06A);


  static  LinearGradient gradientBackgroundCard = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
       const Color(0xffECF0F1).withOpacity(0.48),
       const Color(0xffECF0F1).withOpacity(0),

      ]);

  static  LinearGradient gradientBackgroundCardDark = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xffECF0F1).withOpacity(0.48),
        const Color(0xffECF0F1).withOpacity(0),

      ]);


  static const LinearGradient gradientBlue = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff5691CF),
        Color(0xff2469B1),
        Color(0xff02458B),
      ]);

  static const LinearGradient gradientBlueDark = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff5691CF),
        Color(0xff2469B1),
        Color(0xff02458B),
      ]);


  static const LinearGradient gradientGreen = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff13D3CB),
        Color(0xff06A9A2),
      ]);

  static  LinearGradient gradientGreenWithOpacity = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xff13D3CB).withOpacity(0.15),
        const Color(0xff06A9A2).withOpacity(0.15),
      ]);

  static  LinearGradient gradientGreenWithOpacityDark = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        const Color(0xff13D3CB).withOpacity(0.15),
        const Color(0xff06A9A2).withOpacity(0.15),
      ]);


  static const LinearGradient gradientGreenDark = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff13D3CB),
        Color(0xff06A9A2),
      ]);




  static const LinearGradient gradientPink = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffE83E5E),
        Color(0xffE33455),
      ]);

  static const LinearGradient gradientPinkDark = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffE83E5E),
        Color(0xffE33455),
      ]);



  static const LinearGradient gradientOrange = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffFF8147),
        Color(0xffFF601E),
        Color(0xffFF5100),
      ]);

  static const LinearGradient gradientOrangeDark = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xffFF8147),
        Color(0xffFF601E),
        Color(0xffFF5100),
      ]);




  static const Color customGray = Color(0xffE5E8EB);
  static const Color grayText = Color(0xff919294);
  static const Color selectedColor = Color(0xffEDEFF2);
  static const Color titleColor = Color(0xff252525);
  static const Color buttonColor = Color(0xffEBECF3);
  static const Color secondaryColor = Color(0xffE6EEFF);
  static const Color secondaryColor2 = Color(0xff1F2C39);
  static const Color activeColor = Color(0xff65EB4F);
  static const Color primaryColor = Color(0xff00A1F0);
  static const Color lightPrimaryColor = Color(0xff43A5D7);
  static const Color darkBlueColor = Color(0xff2C3E50);
  static const Color cardColor = Color(0xffecf0f1);
  static const Color backgroundColor = Color(0xffF5F5F5);
  static const Color customLightGray = Color(0xffD9D9D9);
  static const Color unselectedColor = Color(0xff918686); // item navigationbar
  static const Color disableGrayColor = Color(0xff4F5962); // price

  //static const Color white = Color(0xffFFFFFF);
  static const Color iconColorsOnPrimary = Color(0xffFFFFFF);
  static const Color displayLargeColor = Color(0xff0A0A0A);
  static  Color elevationDropDown = Colors.black.withOpacity(0.25);
  static  Color elevationDropDownDark = Colors.black.withOpacity(0.25);


}
