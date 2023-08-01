import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';

import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/ocr_entitiy.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/use_cases/ocr_driver_license_useCase.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/presentation/manager/ocr_bloc/status/ocr_driver_license_status.dart';
import 'package:new_panel/main.dart';

part 'ocr_driver_license_event.dart';
part 'ocr_driver_license_state.dart';

class OcrDriverLicenseBloc extends Bloc<OcrDriverLicenseEvent, OcrDriverLicenseState> {

  OcrDriverLicenseUseCase ocrDriverLicenseUseCase;

  OcrDriverLicenseBloc({required this.ocrDriverLicenseUseCase}) : super(OcrDriverLicenseState(ocrDriverLicenseStatus: OcrDriverLicenseInit())) {


    on<StartProcessDriverLicense>((event, emit) async{

      emit(state.copyWith(newOcrDriverLicenseStatus: OcrDriverLicenseLoading()));

      Either<ResponseError , OcrEntity> response = await ocrDriverLicenseUseCase(event.imageFile);

      response.fold((ResponseError responseError) {
        logger.e(responseError.message);
        emit(state.copyWith(newOcrDriverLicenseStatus: OcrDriverLicenseError(responseError: responseError)));

      }, (OcrEntity ocrEntity) {


        emit(state.copyWith(newOcrDriverLicenseStatus: OcrDriverLicenseCompleted(ocrEntity: ocrEntity)));

      });


    });


  }
}
