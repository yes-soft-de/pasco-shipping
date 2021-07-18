
import 'package:pasco_shipping/utils/logger/logger.dart';


class DistributorResponse {
  DistributorResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<DistributorModel>? data;

  DistributorResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <DistributorModel>[];
      try {
        data = List<DistributorModel>.from(json['Data'].map((x) => DistributorModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class DistributorModel {
  DistributorModel({
    this.id,
    this.fullName,
    this.phone,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
  });

  int? id;
  String? fullName;
  String? phone;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;


  factory DistributorModel.fromJson(Map<String, dynamic> json) => DistributorModel(
    id: json["id"],
    fullName: json["fullName"],
    phone: json["phone"],
    address: json["address"],
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









