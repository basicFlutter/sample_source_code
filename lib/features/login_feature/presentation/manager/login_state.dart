part of 'login_bloc.dart';


class LoginState {

  LoginStatus? loginStatus ;

  LoginState({this.loginStatus});

  LoginState copyWith({LoginStatus? newLoginStatus }){
    return LoginState(loginStatus:  newLoginStatus ?? loginStatus) ;
  }
}


