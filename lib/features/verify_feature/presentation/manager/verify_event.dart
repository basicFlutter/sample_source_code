part of 'verify_bloc.dart';

@immutable
abstract class VerifyEvent {}

class VerifyCodeEvent extends VerifyEvent{
  VerifyMapModel? verifyInfo ;

  VerifyCodeEvent({this.verifyInfo});
}
