import 'package:equatable/equatable.dart';


class VerifyResponseEntity extends Equatable{
  final int statusCode ;
  final String description ;


  const VerifyResponseEntity({required this.statusCode, required this.description});

  @override
  List<Object?> get props => [description , statusCode ];

}