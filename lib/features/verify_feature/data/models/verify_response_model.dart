import 'package:new_panel/features/verify_feature/domain/entities/verify_response_entity.dart';

class VerifyResponseModel extends VerifyResponseEntity{

  final int statusCode ;

  final String description ;

  const VerifyResponseModel({required this.statusCode, required this.description}) : super(statusCode : statusCode , description : description );

 factory VerifyResponseModel.fromJson(Map<String , dynamic > data){
   return VerifyResponseModel(statusCode: data['statusCode'], description:data['']) ;
 }


}