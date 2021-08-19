
import 'package:pasco_shipping/utils/logger/logger.dart';


class AirwaybillSpecificationResponse {
  AirwaybillSpecificationResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<AirwaybillSpecificationModel>? data;

  AirwaybillSpecificationResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <AirwaybillSpecificationModel>[];
      try {
        data = List<AirwaybillSpecificationModel>.from(json['Data'].map((x) => AirwaybillSpecificationModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class AirwaybillSpecificationModel {
  AirwaybillSpecificationModel({
    this.id,
    this.name,
    this.width,


    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser
  });

  int? id;
  String? name;
  String? width;

  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory AirwaybillSpecificationModel.fromJson(Map<String, dynamic> json) => AirwaybillSpecificationModel(
    id: json['id'],
    name: json['name'],
    width: json['weight'].toString(),


    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    createdByUser: json['createdByUser'],
    updatedByUser: json['updatedByUser'],

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









