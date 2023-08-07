import 'package:new_panel/core/data/network/api_provider.dart';

class InventoryImageDataProvider {
  Future<dynamic> callImageInventory({required int vehicleId}) async{
    return await ApiProvider().get("$baseUrl/inventory/$vehicleId/images");
  }
}