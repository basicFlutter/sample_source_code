import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/drivers_license_ocr_feature/domain/entities/object_detect_entity.dart';

abstract  class DriverLicenseDetectionStatus extends Equatable{}

class DriverLicenseDetectionInit extends DriverLicenseDetectionStatus{
  @override
  List<Object?> get props => [];
}

class DriverLicenseDetectionLoading extends DriverLicenseDetectionStatus{
  @override
  List<Object?> get props => [];
}

class DriverLicenseDetectionCompleted extends DriverLicenseDetectionStatus{
  final XFile cameraImage;
  final ObjectDetectEntity objectDetectEntity;
  DriverLicenseDetectionCompleted({required this.cameraImage , required this.objectDetectEntity});
  @override
  List<Object?> get props => [cameraImage , objectDetectEntity];
}

class DriverLicenseDetectionError extends DriverLicenseDetectionStatus{
  final ResponseError responseError;
  DriverLicenseDetectionError({required this.responseError});
  @override
  List<Object?> get props => [responseError];
}