import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/params/no_params.dart';
import 'package:new_panel/core/params/success_response.dart';
import 'package:new_panel/features/verification_feature/domain/use_cases/resend_vrification_change_password_useCase.dart';
import 'package:new_panel/features/verification_feature/domain/use_cases/send_verification_change_password_useCase.dart';
import 'package:new_panel/features/verification_feature/presentation/manager/status/send_verification_change_password_status.dart';


part 'verification_event.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  SendVerificationChangePasswordUseCase sendVerificationChangePasswordUseCase;
  ResendVerificationUseCase resendVerificationUseCase;

  VerificationBloc({required this.resendVerificationUseCase , required this.sendVerificationChangePasswordUseCase}) : super(VerificationState(sendVerificationChangePasswordStatus: SendVerificationChangePasswordInit())) {

    on<SendVerificationChangePassword>((event, emit) async  {

      emit(state.copyWith(newSendVerificationChangePasswordStatus: SendVerificationChangePasswordLoading()));

      Either<ResponseError , SuccessResponse> response = await sendVerificationChangePasswordUseCase(NoParams());

      response.fold((ResponseError responseError) {
        emit(state.copyWith(newSendVerificationChangePasswordStatus: SendVerificationChangePasswordError(responseError: responseError)));

      }, (SuccessResponse successResponse){
        emit(state.copyWith(newSendVerificationChangePasswordStatus: SendVerificationChangePasswordCompleted()));

      });

    });

    on<ReSendVerificationChangePassword>((event, emit) async{

      emit(state.copyWith(newSendVerificationChangePasswordStatus: SendVerificationChangePasswordLoading()));

      Either<ResponseError , SuccessResponse> response = await resendVerificationUseCase(NoParams());

      response.fold((ResponseError responseError) {
        emit(state.copyWith(newSendVerificationChangePasswordStatus: SendVerificationChangePasswordError(responseError: responseError)));

      }, (SuccessResponse successResponse){
        emit(state.copyWith(newSendVerificationChangePasswordStatus: SendVerificationChangePasswordCompleted()));

      });



    });
  }
}
