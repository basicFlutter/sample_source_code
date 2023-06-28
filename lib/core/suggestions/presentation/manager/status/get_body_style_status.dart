import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/error_model.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/core/suggestions/domain/entities/body_style_entity.dart';
import 'package:new_panel/core/suggestions/domain/entities/color_entity.dart';

abstract class GetBodyStyleStatus extends Equatable{}

class GetBodyStyleInitStatus extends GetBodyStyleStatus{
  @override
  List<Object?> get props => [];
}

class GetBodyStyleLoadingStatus extends GetBodyStyleStatus{
  @override
  List<Object?> get props => [];
}


class GetBodyStyleCompletedStatus extends GetBodyStyleStatus{
 final List<BodyStyleEntity> bodyStyleEntityList;
 GetBodyStyleCompletedStatus({required this.bodyStyleEntityList});
  @override
  List<Object?> get props => [bodyStyleEntityList];
}


class GetBodyStyleErrorStatus extends GetBodyStyleStatus{
  final ResponseError responseError ;
  GetBodyStyleErrorStatus({required this.responseError});
  @override
  List<Object?> get props => [responseError];
}