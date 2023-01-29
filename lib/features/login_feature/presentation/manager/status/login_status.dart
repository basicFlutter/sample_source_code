
abstract class LoginStatus {}

class LoadingLoginStatus extends LoginStatus{
}


class LoadingGoogleStatus extends LoginStatus {

}

class FailedLoginStatus extends LoginStatus {}

class SuccessLoginStatus extends LoginStatus {

}