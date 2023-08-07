import 'package:equatable/equatable.dart';
import 'package:new_panel/core/exceptions/failure.dart';
import 'package:new_panel/features/veicle_detail_feature/domain/entities/inventory_image_entity.dart';

abstract class GetInventoryImagesStatus extends Equatable {}

class GetInventoryImagesInit extends GetInventoryImagesStatus{

  @override
  List<Object?> get props => [];
}

class GetInventoryImagesLoading extends GetInventoryImagesStatus{

  @override
  List<Object?> get props => [];
}

class GetInventoryImagesCompleted extends GetInventoryImagesStatus{
  final List<InventoryImageEntity> inventoryImageList;
  GetInventoryImagesCompleted({required this.inventoryImageList});
  @override
  List<Object?> get props => [];
}

class GetInventoryImagesError extends GetInventoryImagesStatus{
 final  ResponseError responseError ;
 GetInventoryImagesError({required this.responseError});
  @override
  List<Object?> get props => [responseError];
}
