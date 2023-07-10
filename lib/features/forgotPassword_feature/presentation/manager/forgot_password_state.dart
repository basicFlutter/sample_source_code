part of 'forgot_password_bloc.dart';

 class ForgotPasswordState  {
   final ForgotPasswordStatus forgotPasswordStatus;
  const ForgotPasswordState({required this.forgotPasswordStatus});

   ForgotPasswordState copyWith({ForgotPasswordStatus? newForgotPasswordStatus}){
     return ForgotPasswordState(forgotPasswordStatus: newForgotPasswordStatus ?? forgotPasswordStatus);

   }
}

