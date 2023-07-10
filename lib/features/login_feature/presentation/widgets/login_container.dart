import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/constants/app_images.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/core/widgets/check_box_with_text.dart';
import 'package:new_panel/core/widgets/custom_check_box.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_divider_with_text.dart';
import 'package:new_panel/core/widgets/custom_error_widget.dart';
import 'package:new_panel/core/widgets/custom_space.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/large_title.dart';
import 'package:new_panel/core/widgets/login_button.dart';
import 'package:new_panel/core/widgets/login_google_button.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:new_panel/core/widgets/text_field_with_back.dart';
import 'package:new_panel/core/widgets/text_field_with_back_with_label.dart';
import 'package:new_panel/features/forgotPassword_feature/presentation/pages/forgot_password_page.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';
import 'package:new_panel/features/main_page_feature/presentation/pages/main_page.dart';

import 'package:new_panel/main.dart';

import 'package:page_transition/page_transition.dart';

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
  final GlobalKey<FormState> formKeyUserName = GlobalKey();
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
              Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
                return  MainPage();
                // return  DashboardCustomerPage();
              }));
            }
          },
          builder: (context, state) {
            return Container(
              width: 1.sw,
              height: 850.h,
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
                    // height: 507.h,

                    color:Theme.of(context).brightness == Brightness.light ? AppColors.white : AppColors.whiteDark,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),

                    // margin: EdgeInsets.only( bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                      key: formKeyUserName,
                      child: Column(
                        children: [

                          SizedBox(
                            height: 15.h,
                          ),
                          _title(),
                          CustomErrorWidget(errorText: messageError, isVisible: state.loginStatus is FailedLoginStatus ? true : false  , iconSrc: AppImages.testSvg) ,

                          SizedBox(
                            height: 15.h,
                          ),
                          TextFieldWithBackWithLabel(
                            controller: userNameController,
                            textInputType: TextInputType.text,
                            hint: "Hanie Karani",
                            label: "User Name",
                            isRequired: true,

                          ),
                          TextFieldWithBackWithLabel(
                            controller: passwordController,
                            textInputType: TextInputType.text,
                            usePassword : true,
                            label: "Password",
                            hint: "Password",
                            // formKey: formKeyUserName,
                            isRequired: true,
                            suffixIcon: Icons.visibility,

                          ),

                          _rememberAndForgetPass(),
                          SizedBox(
                            height: 10.h,
                          ),
                          _buttons(context, state),
                          SizedBox(
                            height: 30.h,
                          ),
                          _registerButton(context),
                          SizedBox(
                            height: 25.h,
                          ),
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
      height: 25.h,
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: CustomCheckBox(
              onChecked: (value) {
                isRememberMe = value!;
              },
              text: "Remember me",
              isChecked: isRememberMe,
              rectangleShape: true,
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

                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child: const ForgotPasswordPage()
                  ),
                );


              },
              child: CustomText(
                text: 'Forgot password?',
                textStyle:Theme.of(context).textTheme.displaySmall ,
                textFontWight: TextFontWight.medium,
                textColor: Theme.of(context).primaryColor,
              )


          )
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
          CustomText(text: 'Not Registered?', textStyle: Theme.of(context).textTheme.displaySmall),

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
              child:

              CustomText(
                text: 'Create Account',
                textStyle: Theme.of(context).textTheme.displaySmall ,
                textColor: Theme.of(context).primaryColor,
              ),
          )

        ],
      ),
    );
  }

  Widget _title() {
    return SizedBox(
      height: 24.h,
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
        RoundCornerButton(
          height: 46.h,
          width:  358.w,
          isLoading: state.loginStatus is LoadingLoginStatus ? true : false,
          onTap: () {
            FocusScope.of(context).unfocus();
            // formKeyUserName.currentState!.validate();
            if (formKeyUserName.currentState!.validate()) {
              LoginMapModel userInfo = LoginMapModel(
                username: userNameController.text,
                password: passwordController.text
                  // username: "customer",
                  // password: "987654321"

              );
              BlocProvider.of<LoginBloc>(context).add(DoLoginEvent(loginInfo: userInfo, isRememberMe:isRememberMe));
            }
          },
          title: "Login",
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
        RoundCornerButton(
          height: 46.h,
          width:  358.w,
          onTap: () {
            FocusScope.of(context).unfocus();
            _onTapLoginGoogle(context);
          },
          svgIconPath: "assets/images/ic_google.svg",
          gradientBackGround: Theme.of(context).brightness == Brightness.light ? AppColors.gradientBlue : AppColors.gradientBlueDark,
          title: "Continue With Google",
        ),
      ],
    );
  }

  Future<void> _onTapLoginGoogle(BuildContext context) async {
    {


      logger.i('YOU WANT TO CHOOSE GOOGLE ACCOUNT ');
      await _googleSignIn.signIn().then((result) {
        if(result?.id != null){
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
        }

      }).catchError((err) {
        AppUtils.showMessage(
            message: err,
            context: context,
           );
        logger.e(err);
      });
    }
  }
}
