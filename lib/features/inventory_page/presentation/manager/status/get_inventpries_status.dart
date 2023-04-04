import '../../../domain/entities/inventory_entity.dart';

abstract class GetInventoryStatus {}

class FailedGetInventoryStatus extends GetInventoryStatus { }

class SuccessGetInventoryStatus extends GetInventoryStatus {
  List<InventoryEntity> allInventory ;
  List<InventoryEntity> currentPageInventory ;

  SuccessGetInventoryStatus({required this.allInventory , required this.currentPageInventory});
}

class LoadingGetInventoryStatus extends GetInventoryStatus {}