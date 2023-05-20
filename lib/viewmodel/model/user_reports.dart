class UserReports {
  User? user;
  Userdetail? userdetail;

  UserReports({this.user, this.userdetail});

  UserReports.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    userdetail = json['userdetail'] != null
        ? Userdetail.fromJson(json['userdetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (userdetail != null) {
      data['userdetail'] = userdetail!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? isVerifyMobile;
  String? roleType;
  int? loginstatus;
  String? createdAt;
  String? updatedAt;
  String? nToken;

  User(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.isVerifyMobile,
      this.roleType,
      this.loginstatus,
      this.createdAt,
      this.updatedAt,
      this.nToken});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    isVerifyMobile = json['is_verify_mobile'];
    roleType = json['role_type'];
    loginstatus = json['loginstatus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nToken = json['nToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['is_verify_mobile'] = isVerifyMobile;
    data['role_type'] = roleType;
    data['loginstatus'] = loginstatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['nToken'] = nToken;
    return data;
  }
}

class Userdetail {
  int? id;
  int? frontUserId;
  String? dob;
  String? profileimage;
  String? gender;
  String? city;
  String? state;
  String? pincode;
  String? createdAt;
  String? updatedAt;

  Userdetail(
      {this.id,
      this.frontUserId,
      this.dob,
      this.profileimage,
      this.gender,
      this.city,
      this.state,
      this.pincode,
      this.createdAt,
      this.updatedAt});

  Userdetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    frontUserId = json['front_user_id'];
    dob = json['dob'];
    profileimage = json['profileimage'];
    gender = json['gender'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['front_user_id'] = frontUserId;
    data['dob'] = dob;
    data['profileimage'] = profileimage;
    data['gender'] = gender;
    data['city'] = city;
    data['state'] = state;
    data['pincode'] = pincode;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
