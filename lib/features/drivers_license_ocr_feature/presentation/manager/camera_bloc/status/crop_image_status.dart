

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';

abstract class CropImageStatus extends Equatable{}

class CropImageInit extends CropImageStatus{

  @override
  List<Object?> get props => [];

}


class CropImageLoading extends CropImageStatus{

  @override
  List<Object?> get props => [];

}


class CropImageCompleted extends CropImageStatus{
  final File imageFile;
  CropImageCompleted({required this.imageFile});
  @override
  List<Object?> get props => [imageFile];
}


class CropImageError extends CropImageStatus{
  final ResponseError responseError;
  CropImageError({required this.responseError});
  @override
  List<Object?> get props => [responseError];

}
