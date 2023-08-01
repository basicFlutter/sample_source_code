part of 'ocr_driver_license_bloc.dart';

 class OcrDriverLicenseState  {
  final OcrDriverLicenseStatus ocrDriverLicenseStatus;
  const OcrDriverLicenseState({required this.ocrDriverLicenseStatus});

  OcrDriverLicenseState copyWith({OcrDriverLicenseStatus? newOcrDriverLicenseStatus}){
    return OcrDriverLicenseState(ocrDriverLicenseStatus: newOcrDriverLicenseStatus??ocrDriverLicenseStatus);
  }
}


