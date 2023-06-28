import 'package:equatable/equatable.dart';

class AssignGoogleResponseEntity extends Equatable{
  final String? id ;
  final String? googleId ;


   const AssignGoogleResponseEntity({ this.id,  this.googleId});

  @override
  // TODO: implement props
  List<Object?> get props => [id , googleId];

}