import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/core/widgets/active_button.dart';
import 'package:new_panel/core/widgets/check_box_with_text.dart';
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
      padding:
          EdgeInsets.only(top: 40.h, bottom: 64.h, left: 24.w, right: 24.w),
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
            SizedBox(
              height: 31.h,
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
            SizedBox(
              height: 15.h,
            ),
            _rememberAndForgetPass(),
            _buttons(context, state),
            _registerButton(context),
          ],
        ),
      ),
    );
  }

  Widget _rememberAndForgetPass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
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
        Flexible(
            flex: 1,
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                    return const ForgetPassPage() ;
                  }));
                },
                child: Text(
                  'Forgot password?',
                  style: Theme.of(context).textTheme.headlineMedium,
                )))
      ],
    );
  }

  Widget _registerButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Not Registered?',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        // MediumTitle(text: '') ,
        TextButton(
            onPressed: () {},
            child: Text(
              'Create Account',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ))
      ],
    );
  }

  Widget _title() {
    return Row(
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
        const CustomSpace(),
        const CustomDividerWithText(
          text: 'OR',
        ),
        const CustomSpace(),
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
