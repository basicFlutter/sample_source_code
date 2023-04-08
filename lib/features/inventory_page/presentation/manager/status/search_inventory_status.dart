import '../../../domain/entities/inventory_entity.dart';

abstract class SearchInventoryStatus{}

class LoadSearchedInventoriesStatus extends SearchInventoryStatus{
  List<InventoryEntity> filteredInventories;

  LoadSearchedInventoriesStatus({required this.filteredInventories});
}