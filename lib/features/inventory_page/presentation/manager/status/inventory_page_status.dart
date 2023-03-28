abstract class InventoryPageStatus {}

class ChangeSelectModeStatus extends InventoryPageStatus{
 final bool  isSelectMode ;

 ChangeSelectModeStatus({required this.isSelectMode});
}