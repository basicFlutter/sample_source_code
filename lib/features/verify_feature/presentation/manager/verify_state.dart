part of 'verify_bloc.dart';

class VerifyState {
  VerifyStatus? verifyStatus;

  VerifyState({this.verifyStatus});

  VerifyState copyWith({VerifyStatus? newVerifyStatus}) {
    return VerifyState(verifyStatus: newVerifyStatus ?? verifyStatus);
  }
}

class VerifyInitial extends VerifyState {}
