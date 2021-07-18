
import 'package:pasco_shipping/utils/logger/logger.dart';


class SubcontractResponse {
  SubcontractResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<SubcontractModel>? data;

  SubcontractResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <SubcontractModel>[];
      try {
        data = List<SubcontractModel>.from(json['Data'].map((x) => SubcontractModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class SubcontractModel {
  SubcontractModel({
    this.id,
    this.fullName,
    this.phone,
    this.serviceName,
    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
  });

  int? id;
  String? fullName;
  String? phone;
  String? serviceName;

  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;


  factory SubcontractModel.fromJson(Map<String, dynamic> json) => SubcontractModel(
    id: json["id"],
    fullName: json["fullName"],
    phone: json["phone"],
    serviceName: json["serviceName"],
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









