part of 'forget_pass_bloc.dart';

class ForgetPassState {
  ForgetPassStatus? forgetPassStatus;

  ForgetPassState({this.forgetPassStatus});

  ForgetPassState copyWith({ForgetPassStatus? newForgetPassStatus}) {
    return ForgetPassState(
        forgetPassStatus: newForgetPassStatus ?? forgetPassStatus);
  }
}
