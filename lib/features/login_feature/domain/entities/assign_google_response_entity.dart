import 'package:equatable/equatable.dart';

class AssignGoogleResponseEntity extends Equatable{
  final String? id ;
  final String? googleId ;


   const AssignGoogleResponseEntity({ this.id,  this.googleId});

  @override
  List<Object?> get props => [id , googleId];

}