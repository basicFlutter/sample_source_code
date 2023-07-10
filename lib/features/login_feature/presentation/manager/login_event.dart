part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable{}


class CheckLoginRemember extends LoginEvent{


  CheckLoginRemember();

  @override
  List<Object?> get props => [];
}

class DoLoginEvent extends LoginEvent {
  final LoginMapModel loginInfo;

  final bool isRememberMe;

  DoLoginEvent(
      {required this.loginInfo,

      required this.isRememberMe});

  @override
  // TODO: implement props
  List<Object?> get props => [loginInfo,isRememberMe];
}





class LoginWithGoogleEvent extends LoginEvent {
  final String googleId;
  final BuildContext context ;
  final bool isRememberMe;

  LoginWithGoogleEvent({ required this.context , required this.googleId, required this.isRememberMe});

  @override
  List<Object?> get props => [googleId,context,isRememberMe];
}
