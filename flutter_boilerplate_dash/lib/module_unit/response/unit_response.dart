
import 'package:pasco_shipping/utils/logger/logger.dart';


class UnitResponse {
  UnitResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<UnitModel>? data;

  UnitResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <UnitModel>[];
      try {
        data = List<UnitModel>.from(json['Data'].map((x) => UnitModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class UnitModel {
  UnitModel({
    this.id,
    this.name,
    this.description,


    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
  });

  int? id;
  String? name;
  String? description;

  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;


  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
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
    timestamp: json['timestamp'],
  );
}









