
import 'dart:convert';

import 'package:pasco_shipping/utils/logger/logger.dart';


class WarehouseResponse {
  WarehouseResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<WarehousesModel>? data;

  WarehouseResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <WarehousesModel>[];
      try {
        data = List<WarehousesModel>.from(json['Data'].map((x) => WarehousesModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class WarehousesModel {
  WarehousesModel({
    this.id,
    this.name,
    this.subContractName,
    this.countryName,
    this.city,
    this.location,
    this.type,
    this.proxyName,
    this.rentingFee,


    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser
  });

  int? id;
  String? name;
  String? subContractName;
  String? countryName;
  String? city;
  String? location;
  String? type;
  String? rentingFee;
  String? proxyName;

  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory WarehousesModel.fromJson(Map<String, dynamic> json) => WarehousesModel(
    id: json['id'],
    name: json['name'],
    subContractName: json['subcontractName']??'',
    countryName: json['countryName']?? '',
    city: json['city']?? '',
    location: json['location']?? '',
    type:json['type']?? '' ,
    rentingFee:json['rentingFee'].toString() ,
    proxyName:json['proxyName'] ??'',

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
    timestamp: json['timestamp'],
  );
}

