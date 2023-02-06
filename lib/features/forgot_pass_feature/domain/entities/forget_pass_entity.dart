import 'package:equatable/equatable.dart';

class ForgetPassResponseEntity extends Equatable{
  final int statusCode ;
  final String description ;


  const ForgetPassResponseEntity({required this.statusCode, required this.description});

  @override
  List<Object?> get props => [description , statusCode ];

}