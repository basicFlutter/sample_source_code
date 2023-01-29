import 'package:equatable/equatable.dart';


class LoginResponseEntity extends Equatable{
final String? refreshToken ;
final String? accessToken ;


  const LoginResponseEntity({ this.refreshToken, this.accessToken});

  @override
  List<Object?> get props => [accessToken , refreshToken ];

}