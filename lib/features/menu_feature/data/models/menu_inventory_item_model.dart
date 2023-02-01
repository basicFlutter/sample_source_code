class MenuInventoryItemModel {
  final String price ;
  final String name ;
  final String imageUrl ;
  final String data ;
  final bool isVisible ;
  final bool isEnable ;


  MenuInventoryItemModel({ required this.isEnable , required this.isVisible ,required this.price, required this.name, required this.imageUrl, required this.data});
}