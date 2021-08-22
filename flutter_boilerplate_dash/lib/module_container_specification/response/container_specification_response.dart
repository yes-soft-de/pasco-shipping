
import 'package:pasco_shipping/utils/logger/logger.dart';


class ContainerSpecificationResponse {
  ContainerSpecificationResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<ContainerSpecificationModel>? data;

  ContainerSpecificationResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <ContainerSpecificationModel>[];
      try {
        data = List<ContainerSpecificationModel>.from(json['Data'].map((x) => ContainerSpecificationModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class ContainerSpecificationModel {
  ContainerSpecificationModel({
    this.id,
    this.name,

    this.widthInMeter,
    this.hightInMeter,
    this.lengthInMeter,
    this.capacityCPM,

    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser
  });

  int? id;
  String? name;

  int? capacityCPM;
  String? widthInMeter;
  int? hightInMeter;
  int? lengthInMeter;

  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory ContainerSpecificationModel.fromJson(Map<String, dynamic> json) => ContainerSpecificationModel(
    id: json['id'],
    name: json['name'],

    capacityCPM: json['capacityCPM'] ?? 0,
    widthInMeter: json['widthInMeter'].toString(),
    hightInMeter: json['hightInMeter'] ?? 0,
    lengthInMeter: json['lengthInMeter'] ?? 0,

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








