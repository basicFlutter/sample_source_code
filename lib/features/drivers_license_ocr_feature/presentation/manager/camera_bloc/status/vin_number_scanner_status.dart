

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/vin_number_entity.dart';

abstract class VinNumberScannerStatus extends Equatable{}

class VinNumberScannerInit extends VinNumberScannerStatus{

  @override
  List<Object?> get props => [];

}


class VinNumberScannerLoading extends VinNumberScannerStatus{

  @override
  List<Object?> get props => [];

}


class VinNumberScannerCompleted extends VinNumberScannerStatus{
  final VinNumberEntity vinNumberEntity;
  VinNumberScannerCompleted({required this.vinNumberEntity});
  @override
  List<Object?> get props => [vinNumberEntity];
}


class VinNumberScannerError extends VinNumberScannerStatus{
  final ResponseError responseError;
  VinNumberScannerError({required this.responseError});
  @override
  List<Object?> get props => [responseError];

}
