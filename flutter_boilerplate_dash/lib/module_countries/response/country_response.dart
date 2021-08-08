
import 'package:pasco_shipping/utils/logger/logger.dart';


class CountryResponse {
  CountryResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<CountryModel>? data;

  CountryResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <CountryModel>[];
      try {
        data = List<CountryModel>.from(json['Data'].map((x) => CountryModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class CountryModel {
  CountryModel({
    this.id,
    this.name,
    this.type,
    this.callingCode,
    this.createdAt,
    this.updatedAt,
    this.updatedByUser,

  });

  int? id;
  String? name;
  String? type;
  String? callingCode;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;


  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    callingCode: json["callingCode"],
    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    updatedByUser: json['createdByUser'],

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









