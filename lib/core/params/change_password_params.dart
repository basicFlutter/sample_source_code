class ChangePasswordParams{
  String newPassword;
  String confirmPassword;
  String verificationCode;
  ChangePasswordParams({required this.newPassword , required this.confirmPassword , required this.verificationCode});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};


    map['password'] = newPassword;
    map['code'] = verificationCode;

    return map;
  }


}