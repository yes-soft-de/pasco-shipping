
import 'package:pasco_shipping/utils/logger/logger.dart';


class HarborResponse {
  HarborResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<HarborModel>? data;

  HarborResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <HarborModel>[];
      try {
        data = List<HarborModel>.from(json['Data'].map((x) => HarborModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class HarborModel {
  HarborModel({
    this.id,
    this.name,
    this.countryID,
    this.countryName,
    this.type,
    this.location,
    this.city,
    this.countryType,

    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser,
  });

  int? id;
  int? countryID;
  String? name;
  String? countryName;
  String? countryType;
  String? location;
  String? city;
  String? type;

  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory HarborModel.fromJson(Map<String, dynamic> json) => HarborModel(
    id: json["id"],
    name: json["name"],
    city: json["city"],
    location: json["location"],
    type: json['type'],
    countryID: json['countryID'],
    countryName:  json['countryName'],
    countryType:  json['countryType'],

    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    updatedByUser: json['updatedByUser'],
    createdByUser: json['createdByUser'],

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









