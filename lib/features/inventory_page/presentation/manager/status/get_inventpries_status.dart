import '../../../domain/entities/inventory_entity.dart';

abstract class GetInventoryStatus {}

class FailedGetInventoryStatus extends GetInventoryStatus { }

class SuccessGetInventoryStatus extends GetInventoryStatus {
  List<InventoryEntity> inventories ;

  SuccessGetInventoryStatus({required this.inventories});
}

class LoadingGetInventoryStatus extends GetInventoryStatus {}