import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/forgot_password_params.dart';
import 'package:new_panel/features/forgotPassword_feature/domain/entities/forgot_password_entity.dart';
import 'package:new_panel/features/forgotPassword_feature/domain/use_cases/forgot_password_useCase.dart';
import 'package:new_panel/features/forgotPassword_feature/presentation/manager/status/forgot_password_status.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordUseCase forgotPasswordUseCase;
  ForgotPasswordBloc({required this.forgotPasswordUseCase}) : super(ForgotPasswordState(forgotPasswordStatus: ForgotPasswordInit())) {

    on<SubmitForgotPassword>((event, emit) async{

      emit(state.copyWith(newForgotPasswordStatus: ForgotPasswordLoading()));

      Either<ResponseError , ForgotPasswordEntity> response = await forgotPasswordUseCase(ForgotPasswordParams(userName: event.userName, email: event.email));

      response.fold((ResponseError responseError ){
        emit(state.copyWith(newForgotPasswordStatus: ForgotPasswordError()));
      }, (ForgotPasswordEntity forgotPasswordEntity) {
        emit(state.copyWith(newForgotPasswordStatus: ForgotPasswordCompleted()));
      });

    });
  }
}
