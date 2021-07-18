
import 'package:pasco_shipping/utils/logger/logger.dart';


class SupplierResponse {
  SupplierResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<SupplierModel>? data;

  SupplierResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <SupplierModel>[];
      try {
        data = List<SupplierModel>.from(json['Data'].map((x) => SupplierModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class SupplierModel {
  SupplierModel({
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


  factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
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









