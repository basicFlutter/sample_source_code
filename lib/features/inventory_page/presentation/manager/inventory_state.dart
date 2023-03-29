part of 'inventory_bloc.dart';

class InventoryState {
  InventoryPageStatus? inventoryPageStatus;

  GetInventoryStatus? getInventoryStatus;

  InventoryState({this.inventoryPageStatus, this.getInventoryStatus});

  InventoryState copyWith(
      {InventoryPageStatus? newInventoryPageStatus,
      GetInventoryStatus? newInventoryStatus}) {
    return InventoryState(
        inventoryPageStatus: newInventoryPageStatus ?? inventoryPageStatus,
        getInventoryStatus: newInventoryStatus ?? getInventoryStatus);
  }
}
