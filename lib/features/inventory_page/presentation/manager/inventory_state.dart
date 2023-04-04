part of 'inventory_bloc.dart';

class InventoryState {
  InventoryPageStatus? inventoryPageStatus;
  GetInventoryStatus? getInventoryStatus;
  SearchInventoryStatus? searchInventoryStatus ;

  InventoryState({this.inventoryPageStatus,this.searchInventoryStatus ,  this.getInventoryStatus});

  InventoryState copyWith(
      {InventoryPageStatus? newInventoryPageStatus,
        SearchInventoryStatus? newSearchInventoryStatus ,
      GetInventoryStatus? newInventoryStatus}) {
    return InventoryState(
      searchInventoryStatus: newSearchInventoryStatus ?? searchInventoryStatus,
        inventoryPageStatus: newInventoryPageStatus ?? inventoryPageStatus,
        getInventoryStatus: newInventoryStatus ?? getInventoryStatus);
  }
}
