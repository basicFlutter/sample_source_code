import 'package:equatable/equatable.dart';

class GoogleResponseEntity extends Equatable {
  final String? refreshToken;

  final String? accessToken;


  const GoogleResponseEntity({this.refreshToken, this.accessToken});

  @override
  List<Object?> get props => [];
}
