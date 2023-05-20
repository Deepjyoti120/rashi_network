class LiveAstrologerModel {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? isVerifyMobile;
  String? roleType;
  int? loginstatus;
  String? createdAt;
  String? updatedAt;
  String? gender;
  int? astrologerId;
  String? photo;
  String? dob;
  String? experience;
  String? categories;
  String? language;
  String? call;
  String? chat;
  String? callPrice;
  String? availableCall;
  String? isBusy;
  String? availableChat;
  String? isRecommended;
  String? isOnboard;
  String? accountNumber;
  String? ifsc;
  String? adharCard;
  String? panCard;

  LiveAstrologerModel(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.isVerifyMobile,
      this.roleType,
      this.loginstatus,
      this.createdAt,
      this.updatedAt,
      this.gender,
      this.astrologerId,
      this.photo,
      this.dob,
      this.experience,
      this.categories,
      this.language,
      this.call,
      this.chat,
      this.callPrice,
      this.availableCall,
      this.isBusy,
      this.availableChat,
      this.isRecommended,
      this.isOnboard,
      this.accountNumber,
      this.ifsc,
      this.adharCard,
      this.panCard});

  LiveAstrologerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    isVerifyMobile = json['is_verify_mobile'];
    roleType = json['role_type'];
    loginstatus = json['loginstatus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    gender = json['gender'];
    astrologerId = json['astrologer_id'];
    photo = json['photo'];
    dob = json['dob'];
    experience = json['experience'];
    categories = json['categories'];
    language = json['language'];
    call = json['call'];
    chat = json['chat'];
    callPrice = json['call_price'];
    availableCall = json['available_call'];
    isBusy = json['is_busy'];
    availableChat = json['available_chat'];
    isRecommended = json['is_recommended'];
    isOnboard = json['is_onboard'];
    accountNumber = json['account_number'];
    ifsc = json['ifsc'];
    adharCard = json['adhar_card'];
    panCard = json['pan_card'];
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
    data['gender'] = gender;
    data['astrologer_id'] = astrologerId;
    data['photo'] = photo;
    data['dob'] = dob;
    data['experience'] = experience;
    data['categories'] = categories;
    data['language'] = language;
    data['call'] = call;
    data['chat'] = chat;
    data['call_price'] = callPrice;
    data['available_call'] = availableCall;
    data['is_busy'] = isBusy;
    data['available_chat'] = availableChat;
    data['is_recommended'] = isRecommended;
    data['is_onboard'] = isOnboard;
    data['account_number'] = accountNumber;
    data['ifsc'] = ifsc;
    data['adhar_card'] = adharCard;
    data['pan_card'] = panCard;
    return data;
  }
}
