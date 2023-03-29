part of 'inventory_bloc.dart';

@immutable
abstract class InventoryEvent {}

class ChangeSelectModeEvent extends InventoryEvent{
 final bool isSelectMode ;

 ChangeSelectModeEvent({required this.isSelectMode});
}

class GetInventoriesEvent extends InventoryEvent{
 final String stateType ;

 GetInventoriesEvent({required this.stateType});
}

class GetWholeInventoriesEvent extends InventoryEvent{

 GetWholeInventoriesEvent();

}
