import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/core/widgets/custom_check_box.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_divider_with_text.dart';
import 'package:new_panel/core/widgets/custom_error_widget.dart';
import 'package:new_panel/core/widgets/custom_text.dart';

import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:new_panel/core/widgets/text_field_with_back_with_label.dart';
import 'package:new_panel/features/forgotPassword_feature/presentation/pages/forgot_password_page.dart';
import 'package:new_panel/core/params/login_input_params.dart';
import 'package:new_panel/features/main_page_feature/presentation/pages/main_page.dart';

import 'package:new_panel/main.dart';

import 'package:page_transition/page_transition.dart';

import '../manager/login_bloc.dart';
import '../manager/status/login_status.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({Key? key , required this.loginMapModel}) : super(key: key);
  final LoginInputParams loginMapModel;
  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {


  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> formKeyUserName = GlobalKey();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isRememberMe = false;
  String? googleId;

  bool isVisibleError = false;
  String messageError = '';
  String srcIconError = '';

  @override
  void initState() {
    super.initState();
    userNameController.text = widget.loginMapModel.username??"";
    passwordController.text = widget.loginMapModel.password??"";
    if(widget.loginMapModel.username!=null && widget.loginMapModel.password != null){
      isRememberMe = true;
    }
  }

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
            logger.w(state.loginStatus);
            logger.i(state.checkLoginStatus);
            if(state.loginStatus is LoginStatusError){
              LoginStatusError failedLoginStatus = state.loginStatus as LoginStatusError;
              isVisibleError = true;
              messageError = failedLoginStatus.error.message??"";
              logger.e(messageError);
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

            return   Container(
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
                            height: 25.h,
                          ),
                          _title(),
                          CustomErrorWidget(errorText: messageError, isVisible: state.loginStatus is LoginStatusError ? true : false  ) ,

                          SizedBox(
                            height: 20.h,
                          ),
                          TextFieldWithBackWithLabel(
                            controller: userNameController,
                            textInputType: TextInputType.text,
                            hint: "Hanie Karani",
                            label: "User Name",
                            isRequired: true,

                          ),
                          SizedBox(
                            height: 13.h,
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
                          SizedBox(
                            height: 11.h,
                          ),

                          _rememberAndForgetPass(),
                          SizedBox(
                            height: 35.h,
                          ),
                          _buttons(context, state),
                          SizedBox(
                            height: 30.h,
                          ),
                          _registerButton(context),
                          SizedBox(
                            height: 27.h,
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



          InkWell(
            onTap: (){
              FocusScope.of(context).unfocus();

              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const ForgotPasswordPage()
                ),
              );
            },
            child: Container(
              height: 25.h,
              child: Center(
                  child:  CustomText(
                    text: 'Forgot password?',
                    textStyle:Theme.of(context).textTheme.displaySmall ,
                    textFontWight: TextFontWight.medium,
                    textColor: Theme.of(context).primaryColor,
                  )
              ),
            ),
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
          CustomText(text: 'Not Registered?',
            textStyle: Theme.of(context).textTheme.labelSmall ,
            textFontWight: TextFontWight.regular,
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
            child:

            CustomText(
              text: 'Create Account',
              textStyle: Theme.of(context).textTheme.labelSmall ,
              textFontWight: TextFontWight.semiBold,
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
          isLoading: state.loginStatus is LoginStatusLoading ,
          onTap: () {
            FocusScope.of(context).unfocus();
            // formKeyUserName.currentState!.validate();
            if (formKeyUserName.currentState!.validate()) {

              LoginInputParams userInfo = LoginInputParams(
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
        AppUtils.showCustomNotification(context: context, messageType: MessageType.error, message:err);

        logger.e(err);
      });
    }
  }
}
