part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();
}


class SubmitForgotPassword extends ForgotPasswordEvent{
  final String userName;
  final String email;
  const SubmitForgotPassword({required this.email , required this.userName});

  @override
  // TODO: implement props
  List<Object?> get props => [userName , email];
}