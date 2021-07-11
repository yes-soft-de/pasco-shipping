// To parse this JSON data, do
//
//     final generalResponse = generalResponseFromJson(jsonString);

import 'dart:convert';
class GeneralResponse {
  GeneralResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  Data? data;

  factory GeneralResponse.fromJson(Map<String, dynamic> json) => GeneralResponse(
    statusCode: json["status_code"],
    msg: json["msg"],
    data: Data.fromJson(json["Data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "msg": msg,
    'Data': data!.toJson(),
  };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data(
  );

  Map<String, dynamic> toJson() => {
  };
}
