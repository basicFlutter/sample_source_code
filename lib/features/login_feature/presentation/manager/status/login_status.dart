


import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/login_input_params.dart';

abstract class LoginStatus {}

class LoginStatusInit extends LoginStatus{
}

class LoginStatusLoading extends LoginStatus{
}


class GoogleStatusLoading extends LoginStatus {

}

class LoginStatusError extends LoginStatus {
  final ResponseError error ;
  final LoginInputParams loginMapModel;

  LoginStatusError({required this.error , required this.loginMapModel});
}

class SuccessLoginStatus extends LoginStatus {

}