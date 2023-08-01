import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/service_locator.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/core/widgets/custom_container.dart';
import 'package:new_panel/core/widgets/custom_error_widget.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:new_panel/core/widgets/text_field_with_back.dart';
import 'package:new_panel/core/widgets/text_field_with_back_with_label.dart';
import 'package:new_panel/features/filter_inventory_page/presentation/widgets/title_input.dart';
import 'package:new_panel/features/forgotPassword_feature/presentation/manager/forgot_password_bloc.dart';
import 'package:new_panel/features/forgotPassword_feature/presentation/manager/status/forgot_password_status.dart';
import 'package:new_panel/main.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ForgotPasswordBloc>(
        create: (context) => ForgotPasswordBloc(forgotPasswordUseCase: locator()),
        child: Builder(
            builder: (context) {
              return Scaffold(
                body: Container(
                  width: 1.sw,
                  height: 926.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/login_bacl.png"),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      CustomContainer(
                          width: 1.sw,
                          // height: 507.h,

                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
                          child: Form(
                            key:    formKey ,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                SizedBox(
                                  height: 15.h,
                                ),
                                _title(),

                                // CustomErrorWidget(errorText: messageError, isVisible: state.loginStatus is FailedLoginStatus ? true : false  , iconSrc: AppImages.testSvg) ,
                                SizedBox(
                                  height: 21.h,
                                ),
                                TitleInput(
                                  title: "User Name",
                                  child: TextFieldWithBack(
                                    controller: userNameController,
                                    textInputType: TextInputType.text,
                                    hint: "Hanie Karani",
                                    isRequired: true,

                                  ),
                                ),
                                TitleInput(
                                  title: "Email",
                                  child: TextFieldWithBack(
                                    controller: emailController,
                                    textInputType: TextInputType.text,


                                    hint: "Email",
                                    hasEmailFormat: true,
                                    // formKey: formKeyUserName,
                                    isRequired: true,


                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),

                                Row(
                                  children: [
                                    Flexible(
                                        child: RoundCornerButton(
                                          onTap: (){
                                            FocusScope.of(context).unfocus();
                                            Navigator.of(context).pop();

                                          },
                                          width: 169.w,
                                          title: "Cancel",
                                          height: 46.h,
                                          textColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary :AppColors.secondaryDark,
                                          backGroundColor: Theme.of(context).brightness == Brightness.light ? AppColors.secondary2 : AppColors.secondary2Dark,

                                        )),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Flexible(
                                        child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                                          listener: (context , state){
                                            if(state.forgotPasswordStatus is ForgotPasswordCompleted){
                                              AppUtils.showCustomNotification(context: context, messageType: MessageType.successful, message: "The new Password has been sent to your Email.");

                                              Navigator.of(context).pop();
                                            }
                                          },
                                          builder: (context, state) {
                                            return RoundCornerButton(
                                              onTap: (){

                                                FocusScope.of(context).unfocus();

                                                if(formKey.currentState!.validate()){
                                                  BlocProvider.of<ForgotPasswordBloc>(context).add(SubmitForgotPassword(email: emailController.text, userName: userNameController.text));
                                                }


                                              },
                                              width: 169.w,
                                              title: "Submit",
                                              height: 46.h,
                                              isLoading: state.forgotPasswordStatus is ForgotPasswordLoading,
                                            );
                                          },
                                        )),

                                  ],
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),

                              ],
                            ),
                          )


                      )

                    ],
                  ),

                ),


              );
            }
        ),
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
          CustomText(text: "Forget Your Password", textStyle: Theme.of(context).textTheme.labelLarge , textFontWight: TextFontWight.bold,)
        ],
      ),
    );
  }
}
