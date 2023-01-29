part of 'verify_bloc.dart';

@immutable
abstract class VerifyEvent {}

class VerifyCodeEvent extends VerifyEvent{
  VerifyMapModel? verifyInfo ;
  BuildContext context ;

  VerifyCodeEvent({this.verifyInfo , required this.context});
}
