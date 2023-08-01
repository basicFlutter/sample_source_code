import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';

abstract class SendVerificationChangePasswordStatus extends Equatable{}

class SendVerificationChangePasswordInit extends SendVerificationChangePasswordStatus{
  @override
  List<Object?> get props => [];
}

class SendVerificationChangePasswordLoading extends SendVerificationChangePasswordStatus{
  @override
  List<Object?> get props => [];
}


class SendVerificationChangePasswordCompleted extends SendVerificationChangePasswordStatus{
  @override
  List<Object?> get props => [];
}


class SendVerificationChangePasswordError extends SendVerificationChangePasswordStatus{
  final ResponseError responseError;
  SendVerificationChangePasswordError({required this.responseError});
  @override
  List<Object?> get props => [responseError];
}