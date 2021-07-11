
class ProfileResponse {
  ProfileResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  ProfileModel? data;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    statusCode: json['status_code'],
    msg: json['msg'],
    data: ProfileModel.fromJson(json['Data']),
  );
}

class ProfileModel {
  ProfileModel({
    this.userName,
    this.city,
    this.country,
    this.image,
    this.location,
    this.phone,
  });

  String? userName;
  String? city;
  String? country;
  String? image;
  String? location;
  String? phone;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    userName: json['userName'],
    city: json['city'],
    country: json['country'],
    image: json['image'],
    location: json['location'],
    phone: json['phone'],
  );
}
