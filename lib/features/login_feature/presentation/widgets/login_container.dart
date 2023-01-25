import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/widgets/active_button.dart';
import 'package:new_panel/core/widgets/check_box_with_text.dart';
import 'package:new_panel/core/widgets/custom_input.dart';
import 'package:new_panel/core/widgets/de_active_button.dart';
import 'package:new_panel/core/widgets/large_title.dart';
import 'package:new_panel/core/widgets/login_button.dart';
import 'package:new_panel/core/widgets/login_google_button.dart';
import 'package:new_panel/features/theme_switcher/presentation/manager/theme_switcher_bloc.dart';

class LoginContainer extends StatelessWidget {
  LoginContainer({Key? key}) : super(key: key);

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428.w,
      height: 562.h,
      padding: EdgeInsets.only(top: 40.h , bottom: 64.h , left: 24.w , right: 24.w),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r ) , topRight: Radius.circular(30.r ))
      ),

      child: Form(

        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/images/accont_icon.svg" , ),
                SizedBox(
                  width: 8.w,
                ),
                const LargeTitle(
                  text: "Login",
                )
              ],
            ),

            SizedBox(
              height: 31.h,
            ),

            CustomInput(
              inputController: userNameController,
              label: "Username",
              isRequired: true,
            ),
            SizedBox(
              height: 16.4.h,
            ),

            CustomInput(
              inputController: passwordController,
              label: "Password",
              isRequired: true,
            ),
            SizedBox(
              height: 15.h,
            ),


            CheckBoxWithText(text: "dsafdsf", isChecked: false),


            Column(children: [
              LoginButton(
                  onTap: (){

                  }
              ),
              LoginGoogleButton(
                  onTap: (){
               // BlocProvider.of<ThemeSwitcherBloc>(context).add(const SwitchThemeEvent());
              }
              )
            ],)
          ],
        ),
      ),


    );
  }
}
