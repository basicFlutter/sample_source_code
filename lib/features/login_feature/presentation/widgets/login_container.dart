import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/core/widgets/active_button.dart';
import 'package:new_panel/core/widgets/check_box_with_text.dart';
import 'package:new_panel/core/widgets/custom_error_widget.dart';
import 'package:new_panel/core/widgets/custom_input.dart';
import 'package:new_panel/core/widgets/custom_space.dart';
import 'package:new_panel/core/widgets/de_active_button.dart';
import 'package:new_panel/core/widgets/large_title.dart';
import 'package:new_panel/core/widgets/login_button.dart';
import 'package:new_panel/core/widgets/login_google_button.dart';
import 'package:new_panel/features/forgot_pass_feature/presentation/pages/forget_pass_page.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';
import 'package:new_panel/features/theme_switcher/presentation/manager/theme_switcher_bloc.dart';
import 'package:new_panel/main.dart';

import '../../../../core/widgets/custom_divider_with_text.dart';
import '../manager/login_bloc.dart';
import '../manager/status/login_status.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({Key? key}) : super(key: key);

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRememberMe = false;
  String? googleId;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    serverClientId:
        "361382020837-pkfp5m8tjnuncugtbnr3ro6rflpt14ra.apps.googleusercontent.com",
    clientId:
        "361382020837-91div34dgrr1i2nsh533hhdcv9vd7rpl.apps.googleusercontent.com",
    scopes: <String>[
      'email',
      'profile',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428.w,
      height: 562.h,
      padding: EdgeInsets.only(top: 39.69.h, bottom: 40.11.h, left: 24.w, right: 24.w),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return _successBody(context, state);
        },
      ),
    );
  }

  Widget _successBody(BuildContext context, LoginState state) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _title(),
            // if(state.loginStatus is FailedLoginStatus)
           CustomErrorWidget(errorText: 'kjflkjlkfjgjdkfj', isVisible: true , iconSrc: AppImages.testSvg) ,
            
            SizedBox(
              height: 20.h,
            ),
            CustomInput(
              inputController: userNameController,
              label: "Username",
              isRequired: true,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomInput(
              inputController: passwordController,
              label: "Password",
              isRequired: true,
            ),
            _rememberAndForgetPass(),
            SizedBox(
              height: 18.h,
            ),
            _buttons(context, state),
            CustomSpace(space: 18.h,) ,
            _registerButton(context),
          ],
        ),
      ),
    );
  }

  Widget _rememberAndForgetPass() {
    return SizedBox(
      height: 40.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(

            child: SizedBox(
              width: 0.5.sw,
              child: CheckBoxWithText(
                onCheck: (value) {
                  isRememberMe = value;
                },
                text: "Remember me",
                isChecked: isRememberMe,
              ),
            ),
          ),
          TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                  return const ForgetPassPage() ;
                }));
              },
              child: Text(
                'Forgot password?',
                style: Theme.of(context).textTheme.headlineMedium,
              ))
        ],
      ),
    );
  }

  Widget _registerButton(BuildContext context) {
    return SizedBox(
      height: 22.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not Registered?',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          // MediumTitle(text: '') ,
          TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
              child: Text(
                'Create Account',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ))
        ],
      ),
    );
  }

  Widget _title() {
    return SizedBox(
      height: 48.h,
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/images/accont_icon.svg",
          ),
          SizedBox(
            width: 8.w,
          ),
          const LargeTitle(
            text: "Login",
          )
        ],
      ),
    );
  }

  Widget _buttons(BuildContext context, LoginState state) {
    return Column(
      children: [
        CustomButton(
          isLoading: state.loginStatus is LoadingLoginStatus ? true : false,
          onTap: () {
            if (formKey.currentState!.validate()) {
              LoginMapModel userInfo = LoginMapModel(
                  username: userNameController.text,
                  password: passwordController.text);
              BlocProvider.of<LoginBloc>(context)
                  .add(DoLoginEvent(loginInfo: userInfo, context: context));
            }
          },
          text: "Login",
        ),
         CustomSpace(space: 18.h,),
        const CustomDividerWithText(
          text: 'OR',
        ),
        CustomSpace(space: 18.h,),
        LoginGoogleButton(
            isLoading: state.loginStatus is LoadingGoogleStatus ? true : false,
            onTap: () => _onTapLoginGoogle(context))
      ],
    );
  }

  Future<void> _onTapLoginGoogle(BuildContext context) async {
    {

      log('YOU WANT TO CHOOSE GOOGLE ACCOUNT ') ;
      await _googleSignIn.signIn().then((result) {
        BlocProvider.of<LoginBloc>(context)
            .add(LoginWithGoogleEvent(googleId: (result?.id)!));
        log('google id ${result?.id}');
        result?.authentication.then((googleKey) {
          logger.i(googleKey.accessToken);
          logger.i(googleKey.idToken);
          logger.i(_googleSignIn.currentUser?.displayName);
        }).catchError((err) {
          logger.e(err);
        });
      }).catchError((err) {
        AppUtils.showMessage(
            message: 'Something went wrong',
            context: context,
            isShowingError: true);
        logger.e(err);
      });
    }
  }
}
