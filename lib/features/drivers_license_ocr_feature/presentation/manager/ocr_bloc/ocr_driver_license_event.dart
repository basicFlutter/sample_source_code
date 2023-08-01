part of 'ocr_driver_license_bloc.dart';

abstract class OcrDriverLicenseEvent extends Equatable {
  const OcrDriverLicenseEvent();
}

class StartProcessDriverLicense extends OcrDriverLicenseEvent{

  final File imageFile;
  const StartProcessDriverLicense({required this.imageFile});
  @override
  List<Object?> get props => [];

}
