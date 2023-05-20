
class BannerModel {
  int? id;
  String? image;
  String? btnTxt;
  String? btnLink;
  int? status;
  String? createdAt;
  String? updatedAt;

  BannerModel(
      {this.id,
      this.image,
      this.btnTxt,
      this.btnLink,
      this.status,
      this.createdAt,
      this.updatedAt});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    btnTxt = json['btn_txt'];
    btnLink = json['btn_link'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['btn_txt'] = this.btnTxt;
    data['btn_link'] = this.btnLink;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
