class ForgotPasswordParams {

  final String userName;
  final String email;
  ForgotPasswordParams({required this.userName , required this.email});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = userName;
    map['email'] = email;
    return map;
  }
}