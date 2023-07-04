import 'package:dio/dio.dart';
import 'package:new_panel/core/data/network/api_provider.dart';


class InventoryRemoteData {
   Future<dynamic> getInventories({required String stateType} ) async{
     Response res = await ApiProvider().get('$baseUrl/inventory?state=$stateType');
     return res ;
   }


   Future<dynamic> getWholeInventories() async{
     Response res = await ApiProvider().get('$baseUrl/inventory/whole');
     return res ;
   }
}
