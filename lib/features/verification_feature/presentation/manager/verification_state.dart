part of 'verification_bloc.dart';

class VerificationState  {
  final SendVerificationChangePasswordStatus sendVerificationChangePasswordStatus;
  const VerificationState({required this.sendVerificationChangePasswordStatus});
  VerificationState copyWith({SendVerificationChangePasswordStatus? newSendVerificationChangePasswordStatus}){
    return VerificationState(sendVerificationChangePasswordStatus: newSendVerificationChangePasswordStatus ?? sendVerificationChangePasswordStatus);
  }

}


