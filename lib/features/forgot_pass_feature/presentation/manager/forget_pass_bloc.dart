
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/forgot_pass_feature/data/models/forget_pass_map_model.dart';
import 'package:new_panel/features/forgot_pass_feature/domain/entities/forget_pass_entity.dart';
import 'package:new_panel/features/forgot_pass_feature/presentation/manager/status/forget_pass_status.dart';

import '../../domain/use_cases/forget_pass_use_case.dart';

part 'forget_pass_event.dart';

part 'forget_pass_state.dart';

class ForgetPassBloc extends Bloc<ForgetPassEvent, ForgetPassState> {
  ForgetPassUseCase forgetPassUseCase;

  ForgetPassBloc({required this.forgetPassUseCase}) : super(ForgetPassState()) {
    on<ForgetPassEvent>((event, emit) async {
      emit(state.copyWith(newForgetPassStatus: LoadingForgetPass()));
      Either<ResponseError, ForgetPassResponseEntity> response =
          await forgetPassUseCase.call(event.forgetPassData);

      response.fold(
          (ResponseError error) {

          }, (ForgetPassResponseEntity data) {
            Navigator.of(event.context ).pop() ;

      });
    });
  }
}
