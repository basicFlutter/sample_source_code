import '../../domain/entities/forget_pass_entity.dart';

class ForgetPassResponseModel extends ForgetPassResponseEntity {
  final int statusCode;

  final String description;

  const ForgetPassResponseModel(
      {required this.statusCode, required this.description})
      : super(statusCode: statusCode, description: description);

  factory ForgetPassResponseModel.fromJson(Map<String, dynamic> data) {
    return ForgetPassResponseModel(
        statusCode: data['statusCode'], description: data['']);
  }
}
