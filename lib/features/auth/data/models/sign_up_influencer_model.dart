class SignUpInfluencerModel {
  int? status;
  String? message;
  Data? data;
  String? token;

  SignUpInfluencerModel({this.status, this.message, this.data, this.token});

  SignUpInfluencerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }
}

class Data {
  String? name;
  String? categoryId;
  String? email;
  String? instagram;
  String? facebook;
  String? youtube;
  String? twitter;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.name,
      this.categoryId,
      this.email,
      this.instagram,
      this.facebook,
      this.youtube,
      this.twitter,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    categoryId = json['category_id'];
    email = json['email'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    youtube = json['youtube'];
    twitter = json['twitter'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
