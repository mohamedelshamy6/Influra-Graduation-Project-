class InfluencerModel {
  int? status;
  String? message;
  Data? data;

  InfluencerModel({this.status, this.message, this.data});

  InfluencerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Influncer>? influncer;

  Data({this.influncer});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['influncer'] != null) {
      influncer = <Influncer>[];
      json['influncer'].forEach((v) {
        influncer!.add(Influncer.fromJson(v));
      });
    }
  }
}

class Influncer {
  String? image;
  String? name;
  void businsesType;

  Influncer({this.image, this.name, this.businsesType});

  Influncer.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    businsesType = json['businses_type'];
  }
}
