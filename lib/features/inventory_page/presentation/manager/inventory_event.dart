part of 'inventory_bloc.dart';

@immutable
abstract class InventoryEvent {}

class ChangeSelectModeEvent extends InventoryEvent{
 bool isSelectMode ;

 ChangeSelectModeEvent({required this.isSelectMode});
}
