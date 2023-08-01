


import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/login_input_params.dart';

abstract class CheckLoginStatus extends Equatable{}

class CheckLoginInit extends CheckLoginStatus{
  @override
  List<Object?> get props => [];
}

class CheckLoginLoading extends CheckLoginStatus{
  @override
  List<Object?> get props => [];
}


class CheckLoginCompleted extends CheckLoginStatus{
  @override
  List<Object?> get props => [];
}

class CheckLoginError extends CheckLoginStatus{
  final ResponseError responseError;
  final LoginInputParams loginMapModel;

  CheckLoginError({required this.responseError , required this.loginMapModel });
  @override
  List<Object?> get props => [responseError , loginMapModel];
}

