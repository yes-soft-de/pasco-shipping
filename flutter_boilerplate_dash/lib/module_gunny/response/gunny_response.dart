import 'package:pasco_shipping/utils/logger/logger.dart';

class GunnyResponse {
  GunnyResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<GunnyModel>? data;

  GunnyResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <GunnyModel>[];
      try {
        data = List<GunnyModel>.from(json['Data'].map((x) => GunnyModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class GunnyModel {
  GunnyModel({
    this.id,
    this.identificationNumber,
    this.status,

    this.createdAt,
    this.updatedAt,


  });

  int? id;
  String? status;
  String? identificationNumber;

  DateTime? createdAt;
  DateTime? updatedAt;



  factory GunnyModel.fromJson(Map<String, dynamic> json) => GunnyModel(
    id: json["id"],
    status: json["status"],
    identificationNumber: json["identificationNumber"],

    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),

  );
}

class CreatedAt {
  CreatedAt({
    this.timestamp,
  });
  int? timestamp;
  factory CreatedAt.fromJson(Map<String, dynamic> json) => CreatedAt(

    timestamp: json["timestamp"],
  );
}