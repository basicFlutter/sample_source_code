import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/core/widgets/check_box_with_text.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_divider_with_text.dart';
import 'package:new_panel/core/widgets/custom_error_widget.dart';
import 'package:new_panel/core/widgets/custom_space.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/large_title.dart';
import 'package:new_panel/core/widgets/login_button.dart';
import 'package:new_panel/core/widgets/login_google_button.dart';
import 'package:new_panel/core/widgets/text_field_with_back.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/widgets/title_input.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';

import 'package:new_panel/main.dart';
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

  bool isVisibleError = false;
  String messageError = '';
  String srcIconError = '';

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
    return SafeArea(
        child: Scaffold(

          // bodyHeight: 357.h,
          // spaceFromBottom:40.11.h ,
          // spaceFromTop: 39.69.h,

          body: BlocConsumer<LoginBloc, LoginState>(

            listener: (context , state){
              if(state.loginStatus is FailedLoginStatus){
                FailedLoginStatus failedLoginStatus = state.loginStatus as FailedLoginStatus;
                isVisibleError = true;
                messageError = failedLoginStatus.error.message??"";
              }
              if(state.loginStatus is SuccessLoginStatus){
                isVisibleError = false;
              }
            },
          builder: (context, state) {
            return Container(
              width: 1.sw,
              height: 926.h,
              decoration: const BoxDecoration(

                image: DecorationImage(
                  image: AssetImage("assets/images/login_bacl.png"),
                  fit: BoxFit.cover
                )
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomContainer(
                    width: 1.sw,
                    height: 470.h,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
                    // margin: EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [

                          SizedBox(
                            height: 24.3.h,
                          ),
                          _title(),
                          CustomErrorWidget(errorText: messageError, isVisible: state.loginStatus is FailedLoginStatus ? true : false  , iconSrc: AppImages.testSvg) ,

                          SizedBox(
                            height: 20.h,
                          ),
                          TitleInput(
                            title: "User Name",

                            child: TextFieldWithBack(
                              controller: userNameController,
                              textInputType: TextInputType.text,
                              hint: "User Name",
                              // isRequired: true,

                            ),
                          ),


                          TitleInput(
                            title: "Password",


                            child: TextFieldWithBack(
                              controller: passwordController,
                              textInputType: TextInputType.text,
                              hint: "Password",

                              // isRequired: true,

                            ),
                          ),

                          _rememberAndForgetPass(),
                          SizedBox(
                            height: 10.h,
                          ),
                          _buttons(context, state),
                          CustomVerticalSpace(space: 18.h,) ,
                          _registerButton(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
    ),
      );
  }


  Widget _rememberAndForgetPass() {
    return Container(
      height: 40.h,
     // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Flexible(
             child: CheckBoxWithText(
                onCheck: (value) {
                  isRememberMe = value;
                },
                text: "Remember me",
                isChecked: isRememberMe,
              ),
           ),

          TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                // Navigator.of(context).push(
                // AnimationTransitionClass.createRouteAnimation(
                // const ForgetPassPage(),
                // textDirection: TextDirection.rtl,
                // isSlide: false
                // ));

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
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
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
          CustomText(text: "Login", textStyle: Theme.of(context).textTheme.labelLarge , textFontWight: TextFontWight.bold,)
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
            FocusScope.of(context).unfocus();
            if (formKey.currentState!.validate()) {
              LoginMapModel userInfo = LoginMapModel(
                  // username: userNameController.text,
                  // password: passwordController.text
                  username: "mirabbasi",
                  password: "hanie@1376"

              );
              BlocProvider.of<LoginBloc>(context).add(DoLoginEvent(loginInfo: userInfo, context: context, isRememberMe:isRememberMe));
            }
          },
          text: "Login",
        ),
         SizedBox(
           height: 10.h,
         ),
        const CustomDividerWithText(
          text: 'OR',
        ),
        SizedBox(
          height: 10.h,
        ),
        LoginGoogleButton(
            isLoading: state.loginStatus is LoadingGoogleStatus ? true : false,
            onTap: () {
              FocusScope.of(context).unfocus();
              _onTapLoginGoogle(context);
            })
      ],
    );
  }

  Future<void> _onTapLoginGoogle(BuildContext context) async {
    {


      logger.i('YOU WANT TO CHOOSE GOOGLE ACCOUNT ');
      await _googleSignIn.signIn().then((result) {
        BlocProvider.of<LoginBloc>(context)
            .add(LoginWithGoogleEvent(googleId: (result?.id)!, isRememberMe: isRememberMe, context: context ));

        logger.i('google id ${result?.id}');
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
