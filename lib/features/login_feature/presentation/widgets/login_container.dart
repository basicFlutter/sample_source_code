import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/widgets/active_button.dart';
import 'package:new_panel/core/widgets/de_active_button.dart';
import 'package:new_panel/core/widgets/login_button.dart';
import 'package:new_panel/core/widgets/login_google_button.dart';
import 'package:new_panel/features/theme_switcher/presentation/manager/theme_switcher_bloc.dart';

class LoginContainer extends StatelessWidget {
  const LoginContainer({Key? key}) : super(key: key);


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

      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset("assets/images/accont_icon.svg" , )
            ],
          ),

          Column(children: [
            LoginButton(onTap: (){

            }),
            LoginGoogleButton(onTap: (){
              BlocProvider.of<ThemeSwitcherBloc>(context).add(const SwitchThemeEvent());
            })
          ],)
        ],
      ),


    );
  }
}
