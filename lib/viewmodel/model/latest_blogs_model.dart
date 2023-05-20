

class BlogsModel {
  int? id;
  int? userId;
  String? title;
  String? slug;
  String? image;
  String? body;
  int? viewCount;
  int? status;
  int? isApproved;
  String? typePost;
  String? createdAt;
  String? updatedAt;

  BlogsModel(
      {this.id,
      this.userId,
      this.title,
      this.slug,
      this.image,
      this.body,
      this.viewCount,
      this.status,
      this.isApproved,
      this.typePost,
      this.createdAt,
      this.updatedAt});

  BlogsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    slug = json['slug'];
    image = json['image'];
    body = json['body'];
    viewCount = json['view_count'];
    status = json['status'];
    isApproved = json['is_approved'];
    typePost = json['type_post'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['slug'] = slug;
    data['image'] = image;
    data['body'] = body;
    data['view_count'] = viewCount;
    data['status'] = status;
    data['is_approved'] = isApproved;
    data['type_post'] = typePost;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
