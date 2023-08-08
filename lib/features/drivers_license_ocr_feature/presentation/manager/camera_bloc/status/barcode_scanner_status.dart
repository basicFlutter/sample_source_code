

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/barcode_entity.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/vin_number_entity.dart';

abstract class BarcodeScannerStatus extends Equatable{}

class BarcodeScannerInit extends BarcodeScannerStatus{

  @override
  List<Object?> get props => [];

}


class BarcodeScannerLoading extends BarcodeScannerStatus{

  @override
  List<Object?> get props => [];

}


class BarcodeScannerCompleted extends BarcodeScannerStatus{
  final BarcodeEntity barcodeEntity;
  BarcodeScannerCompleted({required this.barcodeEntity});
  @override
  List<Object?> get props => [barcodeEntity];
}


class BarcodeScannerError extends BarcodeScannerStatus{
  final ResponseError responseError;
  BarcodeScannerError({required this.responseError});
  @override
  List<Object?> get props => [responseError];

}
