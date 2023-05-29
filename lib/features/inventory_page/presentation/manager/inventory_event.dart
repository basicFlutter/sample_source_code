part of 'inventory_bloc.dart';

@immutable
abstract class InventoryEvent {}

class ChangeSelectModeEvent extends InventoryEvent{
 final bool isSelectMode ;

 ChangeSelectModeEvent({required this.isSelectMode});
}

class GetInventoriesInitializeEvent extends InventoryEvent{
 GetInventoriesInitializeEvent();
}

class GetInventoriesEvent extends InventoryEvent{
 final String stateType ;

 GetInventoriesEvent({required this.stateType});
}

class GetWholeInventoriesEvent extends InventoryEvent{

 GetWholeInventoriesEvent();

}

class GetNewInventoryPage extends InventoryEvent{

}

class SearchInventoryEvent extends InventoryEvent{
 final String searchQuery ;

 SearchInventoryEvent({required this.searchQuery});
}
