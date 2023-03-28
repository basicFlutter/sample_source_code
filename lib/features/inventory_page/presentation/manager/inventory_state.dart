part of 'inventory_bloc.dart';


 class InventoryState {

  InventoryPageStatus? inventoryPageStatus ;

  InventoryState({  this.inventoryPageStatus});

  InventoryState copyWith({InventoryPageStatus? newInventoryPageStatus }){
    return InventoryState(inventoryPageStatus: newInventoryPageStatus ?? inventoryPageStatus) ;
  }

}


