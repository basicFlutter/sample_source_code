import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/error_model.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/suggestions/domain/entities/color_entity.dart';

abstract class GetColorStatus extends Equatable{}

class GetColorInitStatus extends GetColorStatus{
  @override
  List<Object?> get props => [];
}

class GetColorLoadingStatus extends GetColorStatus{
  @override
  List<Object?> get props => [];
}


class GetColorCompletedStatus extends GetColorStatus{
 final List<ColorEntity> colorList;
  GetColorCompletedStatus({required this.colorList});
  @override
  List<Object?> get props => [colorList];
}


class GetColorErrorStatus extends GetColorStatus{
  final ResponseError responseError ;
  GetColorErrorStatus({required this.responseError});
  @override
  List<Object?> get props => [responseError];
}