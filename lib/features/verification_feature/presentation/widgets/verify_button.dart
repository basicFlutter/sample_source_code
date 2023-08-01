import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_panel/core/enums/app_enums.dart';
import 'package:new_panel/core/utils/app_utils.dart';
import 'package:new_panel/core/widgets/round_corner_button.dart';

class VerifyButton extends StatelessWidget {

  /// this widget for send verify and can use Different Bloc class using VerificationType
  ///
   VerifyButton({Key? key , required this.verificationType , this.confirmPassword , this.newPassword, required this.verificationCode , required this.globalKeySaveButton , required this.isDeActive}) : super(key: key);
  final VerificationType verificationType;
  GlobalKey<RoundCornerButtonState> globalKeySaveButton ;
  final String verificationCode;
  final String? newPassword;
  final String? confirmPassword;
  bool isDeActive ;


  @override
  Widget build(BuildContext context) {
    switch(verificationType){

      case VerificationType.changePassword:

       return RoundCornerButton(
          key: globalKeySaveButton,
          onTap:(){
            if(verificationCode.length == 6){
              // widget.onTapSubmitButton(verificationCodeValue);

           //   BlocProvider.of<ChangePasswordBloc>(context).add(SubmitChangePasswordEvent(confirmPassword:confirmPassword!, newPassword: newPassword!, verificationPassword: verificationCode));


            }

          },
       //   isLoading: state.changePasswordStatus is ChangePasswordLoading ,
          width: 358.w,
          height: 46.h,
          isDeActive: isDeActive,

          title: "Verify",
        );
      // return   BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
      //     listener: (context , state){
      //
      //       if(state.changePasswordStatus is ChangePasswordCompleted){
      //
      //         Navigator.of(context).pop();
      //         AppUtils.showCustomNotification(context: context, messageType: MessageType.successful, message: "Change Password Completed.");
      //
      //       }
      //       if(state.changePasswordStatus is ChangePasswordError){
      //         ChangePasswordError changePasswordError = state.changePasswordStatus as ChangePasswordError;
      //
      //         AppUtils.showCustomNotification(context: context, messageType: MessageType.error, message: changePasswordError.responseError.message??"");
      //
      //
      //       }
      //
      //
      //     },
      //     builder: (context, state) {
      //
      //       return RoundCornerButton(
      //         key: globalKeySaveButton,
      //         onTap:(){
      //           if(verificationCode.length == 6){
      //             // widget.onTapSubmitButton(verificationCodeValue);
      //
      //             BlocProvider.of<ChangePasswordBloc>(context).add(SubmitChangePasswordEvent(confirmPassword:confirmPassword!, newPassword: newPassword!, verificationPassword: verificationCode));
      //
      //
      //           }
      //
      //         },
      //         isLoading: state.changePasswordStatus is ChangePasswordLoading ,
      //         width: 358.w,
      //         height: 46.h,
      //         isDeActive: isDeActive,
      //
      //         title: "Verify",
      //       );
      //
      //     },
      //   );
    }
  }
}
