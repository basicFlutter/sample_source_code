


import 'package:new_panel/core/exceptions/failure.dart';

abstract class LoginStatus {}

class LoadingLoginStatus extends LoginStatus{
}


class LoadingGoogleStatus extends LoginStatus {

}

class FailedLoginStatus extends LoginStatus {
  ResponseError error ;

  FailedLoginStatus({required this.error});
}

class SuccessLoginStatus extends LoginStatus {

}