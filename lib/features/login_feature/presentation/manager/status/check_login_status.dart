


import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/login_feature/data/models/login_map_model.dart';

abstract class CheckLoginStatus extends Equatable{}

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
  final LoginMapModel loginMapModel;

  CheckLoginError({required this.responseError , required this.loginMapModel });
  @override
  List<Object?> get props => [responseError , loginMapModel];
}

