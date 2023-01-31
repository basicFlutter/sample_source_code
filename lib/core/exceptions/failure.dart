import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final response;

  const Failure([this.response]);

  @override
  List<Object?> get props => [response];
}

class ServerFailure extends Failure {
  final error;

  const ServerFailure({this.error}) : super(error);
}

class ResponseError extends Failure {
  String? act;
  String? alertType;
  dynamic data;
  String? entity;
  String? message;
  String? reason;
  String? type;

  ResponseError(
      {required this.message,
      required this.alertType,
      required this.type,
      required this.data,
      required this.act,
      required this.entity,
      required this.reason});
}
