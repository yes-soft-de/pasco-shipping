import 'package:pasco_shipping/utils/logger/logger.dart';

class WarehouseResponse {
  WarehouseResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<WarehouseModel>? data;

  WarehouseResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <WarehouseModel>[];
      try {
        data = List<WarehouseModel>.from(json['Data'].map((x) => WarehouseModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class WarehouseModel {
  WarehouseModel({
    this.id,
    this.name,
    this.countryName,
    this.type,
    this.city,
    this.location,
    this.subcontractName,
    this.proxyName,
    this.rentingFee,

    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
  });

  int? id;
  String? name;
  String? subcontractName;
  String? countryName;

  String? city;
  String? rentingFee;
  String? location;
  String? type;
  String? proxyName;



  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;


  factory WarehouseModel.fromJson(Map<String, dynamic> json) => WarehouseModel(
    id: json['id'],
    type: json['type'],
name: json['name'],
    city: json['launchCountry'],
    countryName: json['destinationCountry'],

    location: json['travelNumber'],
    proxyName: json['status'],
    subcontractName: json['subcontractName'],
    rentingFee: json['rentingFee'],


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