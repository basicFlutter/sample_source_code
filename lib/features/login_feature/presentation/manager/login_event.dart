part of 'login_bloc.dart';

abstract class LoginEvent {}

class DoLoginEvent extends LoginEvent {
  final LoginMapModel loginInfo;

  final BuildContext context;

  final bool isRememberMe;

  DoLoginEvent(
      {required this.loginInfo,
      required this.context,
      required this.isRememberMe});
}



class LoginWithGoogleEvent extends LoginEvent {
  final String googleId;
  final BuildContext context ;
  final bool isRememberMe;

  LoginWithGoogleEvent({ required this.context , required this.googleId, required this.isRememberMe});
}
