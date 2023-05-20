class PrReleaseModel {
  int? id;
  String? heading;
  String? subheading;
  String? hreflink;
  String? desktopimg;
  String? mobileimg;
  String? bannerType;
  int? status;
  String? createdAt;
  String? updatedAt;

  PrReleaseModel(
      {this.id,
      this.heading,
      this.subheading,
      this.hreflink,
      this.desktopimg,
      this.mobileimg,
      this.bannerType,
      this.status,
      this.createdAt,
      this.updatedAt});

  PrReleaseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    subheading = json['subheading'];
    hreflink = json['hreflink'];
    desktopimg = json['desktopimg'];
    mobileimg = json['mobileimg'];
    bannerType = json['banner_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['subheading'] = this.subheading;
    data['hreflink'] = this.hreflink;
    data['desktopimg'] = this.desktopimg;
    data['mobileimg'] = this.mobileimg;
    data['banner_type'] = this.bannerType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
