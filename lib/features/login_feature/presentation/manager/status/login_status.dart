
import 'package:new_panel/core/exceptions/error_model.dart';

abstract class LoginStatus {}

class LoadingLoginStatus extends LoginStatus{
}


class LoadingGoogleStatus extends LoginStatus {

}

class FailedLoginStatus extends LoginStatus {
  ErrorModel error ;

  FailedLoginStatus({required this.error});
}

class SuccessLoginStatus extends LoginStatus {

}