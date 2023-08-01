part of 'login_bloc.dart';


class LoginState {

  LoginStatus? loginStatus ;
  CheckLoginStatus checkLoginStatus;

  LoginState({this.loginStatus , required this.checkLoginStatus});

  LoginState copyWith({LoginStatus? newLoginStatus ,CheckLoginStatus? newCheckLoginStatus}){
    return LoginState(loginStatus:  newLoginStatus ?? loginStatus , checkLoginStatus: newCheckLoginStatus ?? checkLoginStatus) ;
  }
}


