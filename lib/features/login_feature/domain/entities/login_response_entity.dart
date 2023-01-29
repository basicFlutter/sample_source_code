import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  final String? refreshToken;
  final String? accessToken;
  final String? message;
  final String? type;
  final String? alertType;

  const LoginResponseEntity({this.refreshToken, this.accessToken , this.message , this.type, this.alertType});

  @override
  List<Object?> get props => [accessToken, refreshToken , message , type , alertType];
}
