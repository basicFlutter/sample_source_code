class User {
  User({
      this.id, 
      this.fName, 
      this.lName, 
      this.username, 
      this.email, 
      this.mobile, 
      this.address, 
      this.postalcode, 
      this.active, 
      this.campaignStatus, 
      this.isActive, 
      this.gender, 
      this.birthdate, 
      this.avatar, 
      this.emailVerified, 
      this.emailExpireTime, 
      this.mobileVerified, 
      this.mobileExpireTime, 
      this.passwordResetExp, 
      this.driverLicensePhoto, 
      this.driverLicenseNO, 
      this.driverLicenseExpireDate, 
      this.driverLicenseIssuedDate, 
      this.faxNO, 
      this.signitureURL, 
      this.unsubscribeStatus, 
      this.apartemanNo, 
      this.fullName, 
      this.online, 
      this.isGuest, 
      this.lastOnline, 
      this.city, 
      this.province, 
      this.registerNumber, 
      this.viewingAllBranches, 
      this.driverLicensePhotoBack, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.frkDealerShipId, 
      this.frkCity, 
      this.frkLegalUserId, 
      this.frkRole,});

  User.fromJson(dynamic json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    username = json['username'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    postalcode = json['postalcode'];
    active = json['active'];
    campaignStatus = json['campaign_status'];
    isActive = json['is_active'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    avatar = json['avatar'];
    emailVerified = json['email_verified'];
    emailExpireTime = json['email_expire_time'];
    mobileVerified = json['mobile_verified'];
    mobileExpireTime = json['mobile_expire_time'];
    passwordResetExp = json['passwordResetExp'];
    driverLicensePhoto = json['driver_license_photo'];
    driverLicenseNO = json['driver_license_NO'];
    driverLicenseExpireDate = json['driver_license_expire_date'];
    driverLicenseIssuedDate = json['driver_license_issued_date'];
    faxNO = json['fax_NO'];
    signitureURL = json['signiture_URL'];
    unsubscribeStatus = json['unsubscribe_status'];
    apartemanNo = json['aparteman_no'];
    fullName = json['full_name'];
    online = json['online'];
    isGuest = json['is_guest'];
    lastOnline = json['lastOnline'];
    city = json['city'];
    province = json['province'];
    registerNumber = json['register_number'];
    viewingAllBranches = json['viewing_all_branches'];
    driverLicensePhotoBack = json['driver_license_photo_back'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    frkDealerShipId = json['frk_dealer_ship_id'];
    frkCity = json['frk_city'];
    frkLegalUserId = json['frk_legal_user_id'];
    frkRole = json['frk_role'];
  }
  int? id;
  String? fName;
  String? lName;
  String? username;
  String? email;
  String? mobile;
  dynamic address;
  dynamic postalcode;
  int? active;
  int? campaignStatus;
  int? isActive;
  int? gender;
  String? birthdate;
  String? avatar;
  int? emailVerified;
  String? emailExpireTime;
  int? mobileVerified;
  String? mobileExpireTime;
  dynamic passwordResetExp;
  String? driverLicensePhoto;
  String? driverLicenseNO;
  dynamic driverLicenseExpireDate;
  dynamic driverLicenseIssuedDate;
  dynamic faxNO;
  dynamic signitureURL;
  String? unsubscribeStatus;
  dynamic apartemanNo;
  dynamic fullName;
  bool? online;
  bool? isGuest;
  String? lastOnline;
  dynamic city;
  dynamic province;
  String? registerNumber;
  bool? viewingAllBranches;
  dynamic driverLicensePhotoBack;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? frkDealerShipId;
  int? frkCity;
  dynamic frkLegalUserId;
  int? frkRole;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['f_name'] = fName;
    map['l_name'] = lName;
    map['username'] = username;
    map['email'] = email;
    map['mobile'] = mobile;
    map['address'] = address;
    map['postalcode'] = postalcode;
    map['active'] = active;
    map['campaign_status'] = campaignStatus;
    map['is_active'] = isActive;
    map['gender'] = gender;
    map['birthdate'] = birthdate;
    map['avatar'] = avatar;
    map['email_verified'] = emailVerified;
    map['email_expire_time'] = emailExpireTime;
    map['mobile_verified'] = mobileVerified;
    map['mobile_expire_time'] = mobileExpireTime;
    map['passwordResetExp'] = passwordResetExp;
    map['driver_license_photo'] = driverLicensePhoto;
    map['driver_license_NO'] = driverLicenseNO;
    map['driver_license_expire_date'] = driverLicenseExpireDate;
    map['driver_license_issued_date'] = driverLicenseIssuedDate;
    map['fax_NO'] = faxNO;
    map['signiture_URL'] = signitureURL;
    map['unsubscribe_status'] = unsubscribeStatus;
    map['aparteman_no'] = apartemanNo;
    map['full_name'] = fullName;
    map['online'] = online;
    map['is_guest'] = isGuest;
    map['lastOnline'] = lastOnline;
    map['city'] = city;
    map['province'] = province;
    map['register_number'] = registerNumber;
    map['viewing_all_branches'] = viewingAllBranches;
    map['driver_license_photo_back'] = driverLicensePhotoBack;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['deletedAt'] = deletedAt;
    map['frk_dealer_ship_id'] = frkDealerShipId;
    map['frk_city'] = frkCity;
    map['frk_legal_user_id'] = frkLegalUserId;
    map['frk_role'] = frkRole;
    return map;
  }

}