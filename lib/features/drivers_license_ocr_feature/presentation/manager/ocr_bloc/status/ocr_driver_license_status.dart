import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/ocr_entitiy.dart';

abstract class OcrDriverLicenseStatus extends Equatable{}


class OcrDriverLicenseInit extends OcrDriverLicenseStatus{

  @override
  List<Object?> get props => [];

}


class OcrDriverLicenseLoading extends OcrDriverLicenseStatus{

  @override
  List<Object?> get props => [];

}


class OcrDriverLicenseCompleted extends OcrDriverLicenseStatus{

 final  OcrEntity ocrEntity;
 OcrDriverLicenseCompleted({required this.ocrEntity});
  @override
  List<Object?> get props => [ocrEntity];

}

class OcrDriverLicenseError extends OcrDriverLicenseStatus{
  final ResponseError responseError;
  OcrDriverLicenseError({required this.responseError});
  @override
  List<Object?> get props => [responseError];

}
