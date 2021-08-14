
import 'package:pasco_shipping/utils/logger/logger.dart';


class ProxyResponse {
  ProxyResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<ProxyModel>? data;

  ProxyResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <ProxyModel>[];
      try {
        data = List<ProxyModel>.from(json['Data'].map((x) => ProxyModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class ProxyModel {
  ProxyModel({
    this.id,
    this.fullName,
    this.phone,
    this.address,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser
  });

  int? id;
  String? fullName;
  String? phone;
  String? address;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory ProxyModel.fromJson(Map<String, dynamic> json) => ProxyModel(
    id: json["id"],
    fullName: json["fullName"]??'',
    phone: json["phone"]??'',
    address: json["address"]??'',
    email: json["email"] ?? '',
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









