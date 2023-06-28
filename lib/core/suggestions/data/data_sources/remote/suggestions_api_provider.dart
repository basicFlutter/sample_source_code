import 'package:dio/dio.dart';
import 'package:new_panel/core/data/network/api_provider.dart';

class SuggestionApiProvider {

  Future<dynamic> callRoteColors() async{
    Response response = await ApiProvider().get('$baseUrl/inventory/colors');
    return response ;
  }

  Future<dynamic> callRoteBodyStyle() async{
    Response response = await ApiProvider().get('$baseUrl/inventory/bodystyles');
    return response ;
  }
}