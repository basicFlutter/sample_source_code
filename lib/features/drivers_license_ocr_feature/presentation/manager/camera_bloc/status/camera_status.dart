import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';

abstract class CameraStatus extends Equatable{}

class CameraInit extends CameraStatus{
  @override
  List<Object?> get props => [];
}

class CameraInitLoading extends CameraStatus{
  @override
  List<Object?> get props => [];
}

class CameraInitCompleted extends CameraStatus{
  final CameraController cameraController;
  CameraInitCompleted({required this.cameraController});
  @override
  List<Object?> get props => [cameraController];
}

class CameraInitError extends CameraStatus{
 final ResponseError responseError;
  CameraInitError({required this.responseError});
  @override
  List<Object?> get props => [responseError];
}