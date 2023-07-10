import 'package:equatable/equatable.dart';

abstract class ForgotPasswordStatus extends Equatable{}


class ForgotPasswordInit extends ForgotPasswordStatus{

  @override
  List<Object?> get props => [];

}

class ForgotPasswordLoading extends ForgotPasswordStatus{

  @override
  List<Object?> get props => [];

}

class ForgotPasswordCompleted extends ForgotPasswordStatus{

  @override
  List<Object?> get props => [];

}


class ForgotPasswordError extends ForgotPasswordStatus{

  @override
  List<Object?> get props => [];

}