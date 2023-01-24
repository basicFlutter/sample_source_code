import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/features/login_feature/presentation/widgets/hillz_text.dart';
import 'package:new_panel/features/login_feature/presentation/widgets/login_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [
    ]);
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,

              child: Image.asset(
                  "assets/images/light_login_back.png",
              fit: BoxFit.fitWidth,
              )
          ),
          Positioned(
            top: 68.h,
              left: 71.w,
              right: 88.w,
              child: const HillzLogo()
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: LoginContainer(

            ),
          )
        ],
      ),
    );
  }
}
