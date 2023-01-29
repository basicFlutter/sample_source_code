part of 'login_bloc.dart';


 abstract class LoginEvent {


}

class DoLoginEvent extends LoginEvent{
 final LoginMapModel loginInfo ;
 final BuildContext context ;

  DoLoginEvent({required this.loginInfo , required this.context });
}

class ChooseGoogleAccountEvent extends LoginEvent{
final bool isLoading ;

ChooseGoogleAccountEvent({required this.isLoading});
}
