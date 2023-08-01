import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/constants/app_colors.dart';
import 'package:new_panel/core/constants/blurMenuItem.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/service_locator.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/core/widgets/appBar.dart';
import 'package:new_panel/core/widgets/custom_body.dart';
import 'package:new_panel/core/widgets/custom_text.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';
import 'package:new_panel/features/verification_feature/presentation/manager/status/send_verification_change_password_status.dart';
import 'package:new_panel/features/verification_feature/presentation/manager/verification_bloc.dart';
import 'package:new_panel/features/verification_feature/presentation/widgets/verify_button.dart';

class VerificationPage extends StatefulWidget {
  VerificationPage({Key? key , required this.verificationType , required this.onTapSubmitButton , this.newPassword , this.confirmPassword}) : super(key: key);
  final VerificationType verificationType;
  final String? newPassword;
  final String? confirmPassword;
  Function(String verificationCode) onTapSubmitButton;



  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  String verificationCodeValue = "";
  bool isDeActiveButton = false;
  GlobalKey<RoundCornerButtonState> globalKeySaveButton = GlobalKey<
      RoundCornerButtonState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disableVerifyButton();
  }

  void disableVerifyButton() async{
    isDeActiveButton = true;

    globalKeySaveButton.currentState?.widget.isDeActive = true;
    Future.delayed(Duration.zero, () async {
      globalKeySaveButton.currentState?.setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /// check verification type and send event

      providers: [
        BlocProvider<VerificationBloc>(create:   (context)=>  VerificationBloc(sendVerificationChangePasswordUseCase: locator(),resendVerificationUseCase: locator())..add(widget.verificationType == VerificationType.changePassword ? SendVerificationChangePassword() : ReSendVerificationChangePassword()),),

      //  BlocProvider<ChangePasswordBloc>(create:   (context)=>  ChangePasswordBloc( submitChangePasswordUseCase: locator()))
      ],
      child: Builder(
          builder: (context) {
            return CustomBody(
                searchbarController: searchController,

                // showSelectDealerShip: false,
                // appBarCustom: const AppBarCustom(
                //   title: "Tow-factor Authentication",
                // ),

                // onClickedItemMenu: (BlurMenuItem item) {
                //
                // },
                body: BlocListener<VerificationBloc, VerificationState>(
                  listener: (context, state) {
                    if(state.sendVerificationChangePasswordStatus is SendVerificationChangePasswordCompleted){
                      AppUtils.showCustomNotification(context: context, messageType: MessageType.successful, message: "Send Authentication Successfully.");
                    }

                    if(state.sendVerificationChangePasswordStatus is SendVerificationChangePasswordError){
                      SendVerificationChangePasswordError sendVerificationChangePasswordError = state.sendVerificationChangePasswordStatus as SendVerificationChangePasswordError;
                      AppUtils.showCustomNotification(context: context, messageType: MessageType.error, message: sendVerificationChangePasswordError.responseError.message??"");

                    }
                  },
                  child: Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: formKey,
                        child: Container(
                          margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 65.h,
                              ),

                              CustomText(text: "Enter Code", textStyle: Theme.of(context).textTheme.titleLarge , textFontWight: TextFontWight.bold,textColor:Theme.of(context).primaryColor ,),
                              SizedBox(
                                height: 5.h,
                              ),
                              CustomText(text: "We’ve sent a 6-digit code to your mobile device.", textStyle: Theme.of(context).textTheme.displayLarge , textFontWight: TextFontWight.regular),

                              SizedBox(
                                height: 50.h,
                              ),

                              OtpTextField(
                                numberOfFields: 6,
                                borderColor: Theme.of(context).primaryColor,
                                disabledBorderColor: Theme.of(context).primaryColor,
                                enabledBorderColor: Theme.of(context).primaryColor,
                                focusedBorderColor: Theme.of(context).primaryColor,
                                keyboardType: TextInputType.visiblePassword,
                                borderRadius: BorderRadius.all(Radius.circular(6.w)),
                                fieldWidth: 47.w,
                                borderWidth: 1,
                                showFieldAsBox: true,
                                onCodeChanged: (String code) async{
                                  if(code.length != 6){
                                    isDeActiveButton = true;
                                    verificationCodeValue = code;
                                    globalKeySaveButton.currentState?.widget.isDeActive = true;
                                    Future.delayed(Duration.zero, () async {
                                      globalKeySaveButton.currentState?.setState(() {});
                                    });
                                  }


                                },
                                onSubmit: (String verificationCode) async{

                                  isDeActiveButton = false;
                                  verificationCodeValue = verificationCode;
                                  globalKeySaveButton.currentState?.widget.isDeActive = false;
                                  Future.delayed(Duration.zero, () async {
                                    globalKeySaveButton.currentState?.setState(() {});
                                  });

                                }, // end onSubmit
                              ),

                              SizedBox(
                                height: 30.h,
                              ),

                              VerifyButton(
                                verificationType: widget.verificationType,
                                verificationCode: verificationCodeValue,
                                newPassword: widget.newPassword,
                                confirmPassword: widget.newPassword,
                                globalKeySaveButton: globalKeySaveButton,
                                isDeActive: isDeActiveButton,
                              ),

                              // BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
                              //   listener: (context , state){
                              //
                              //     if(state.changePasswordStatus is ChangePasswordCompleted){
                              //
                              //       Navigator.of(context).pop();
                              //       AppUtils.showCustomNotification(context: context, messageType: MessageType.successful, message: "Change Password Completed.");
                              //
                              //     }
                              //     if(state.changePasswordStatus is ChangePasswordError){
                              //       ChangePasswordError changePasswordError = state.changePasswordStatus as ChangePasswordError;
                              //
                              //       AppUtils.showCustomNotification(context: context, messageType: MessageType.error, message: changePasswordError.responseError.message??"");
                              //
                              //
                              //     }
                              //
                              //
                              //   },
                              //   builder: (context, state) {
                              //
                              //     return RoundCornerButton(
                              //       key: globalKeySaveButton,
                              //       onTap:(){
                              //         if(verificationCodeValue.length == 6){
                              //          // widget.onTapSubmitButton(verificationCodeValue);
                              //
                              //           BlocProvider.of<ChangePasswordBloc>(context).add(SubmitChangePasswordEvent(confirmPassword: widget.confirmPassword!, newPassword: widget.newPassword!, verificationPassword: verificationCodeValue));
                              //
                              //
                              //         }
                              //
                              //       },
                              //       isLoading: state.changePasswordStatus is ChangePasswordLoading ,
                              //       width: 358.w,
                              //       height: 46.h,
                              //
                              //       title: "Verify",
                              //     );
                              //
                              //   },
                              // ),

                              SizedBox(
                                height: 30.h,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [

                                      CustomText(text: "Don’t receive your code?", textStyle: Theme.of(context).textTheme.labelSmall , textFontWight: TextFontWight.regular),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      InkWell(
                                          onTap: (){
                                            BlocProvider.of<VerificationBloc>(context).add(ReSendVerificationChangePassword());
                                          },
                                          child: CustomText(text: "Resend it", textStyle: Theme.of(context).textTheme.labelSmall , textFontWight: TextFontWight.bold , textColor: Theme.of(context).primaryColor,)),

                                    ],

                                  )
                                ],
                              )



                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            );
          }
      ),
    );
  }
}
