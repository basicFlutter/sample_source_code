import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/service_locator.dart';
import 'package:new_panel/core/widgets/custom_image_network.dart';
import 'package:new_panel/features/login_feature/presentation/manager/login_bloc.dart';
import 'package:new_panel/features/login_feature/presentation/manager/status/check_login_status.dart';
import 'package:new_panel/features/login_feature/presentation/manager/status/login_status.dart';
import 'package:new_panel/features/login_feature/presentation/pages/login_page.dart';
import 'package:new_panel/features/main_page_feature/presentation/pages/main_page.dart';

import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) =>
      LoginBloc(loginUseCase: locator(), authGoogleUseCase: locator(),)
        ..add(CheckLoginRemember()),
      child: Builder(
          builder: (context) {
            return Scaffold(
              body: BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if(state.checkLoginStatus is CheckLoginError){
                    CheckLoginError checkLoginError = state.checkLoginStatus as CheckLoginError;
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 200),
                          child:   LoginPage(
                            loginMapModel: checkLoginError.loginMapModel,
                          )
                      ),
                    );
                  }
                  if(state.loginStatus is SuccessLoginStatus){
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 200),
                          child:   MainPage()
                      ),
                    );
                  }
                },
                child: SizedBox(
                  height: 1.sh,
                  width: 1.sw,
                  child: Center(
                      child: Image.asset(AppImages.lightSplash)
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
