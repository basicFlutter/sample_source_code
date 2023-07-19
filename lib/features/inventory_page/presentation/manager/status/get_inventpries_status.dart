import 'package:new_panel/core/exceptions/failure.dart';

import '../../../domain/entities/inventory_entity.dart';

abstract class GetInventoryStatus {}


class GetInventoryLoading extends GetInventoryStatus {}


class GetInventoryCompleted extends GetInventoryStatus {
  List<InventoryEntity> allInventory ;
  List<InventoryEntity> currentPageInventory ;

  GetInventoryCompleted({required this.allInventory , required this.currentPageInventory});
}




class GetInventoryError extends GetInventoryStatus {
  final ResponseError responseError;
  GetInventoryError({required this.responseError});
}