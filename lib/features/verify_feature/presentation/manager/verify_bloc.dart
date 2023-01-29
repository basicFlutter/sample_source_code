import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/verify_feature/data/models/verify_map_model.dart';
import 'package:new_panel/features/verify_feature/domain/entities/verify_response_entity.dart';
import 'package:new_panel/features/verify_feature/presentation/manager/status/verify_status.dart';

import '../../domain/use_cases/verify_use_case.dart';

part 'verify_event.dart';

part 'verify_state.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  VerifyUseCase verifyUseCase;

  VerifyBloc({required this.verifyUseCase}) : super(VerifyInitial()) {
    on<VerifyEvent>((event, emit) {});

    on<VerifyCodeEvent>((event, emit) async {
      emit(state.copyWith(newVerifyStatus: LoadingVerifyStatus()));
      VerifyMapModel? verifyModel = event.verifyInfo;

      Either<Failure, VerifyResponseEntity> response =
          await verifyUseCase.call({'data' : verifyModel!.toJson()});

      response.fold((error) {
        emit(state.copyWith(newVerifyStatus: FailedVerifyStatus()));
        log('FAILLLLLLLLLLLLLLLLLLLLLLLEEEEEEDDDDDDDDDDD');
      }, (VerifyResponseEntity data) {
        emit(state.copyWith(newVerifyStatus: SuccessVerifyStatus()));
        log('SUCCCEEEEEEEEEEEEEEEEEEEEEESSSSSSSSSSSSSSSSS');
      });
    });
  }
}
