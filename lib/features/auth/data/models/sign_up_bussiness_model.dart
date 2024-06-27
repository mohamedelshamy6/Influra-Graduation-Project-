class SignUpBussinessModel {
  int? status;
  String? message;
  Data? data;
  String? token;

  SignUpBussinessModel({this.status, this.message, this.data, this.token});

  SignUpBussinessModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }
}

class Data {
  String? name;
  String? email;
  String? categoryId;
  String? password;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.name,
      this.email,
      this.categoryId,
      this.password,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    categoryId = json['category_id'];
    password = json['password'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
}
