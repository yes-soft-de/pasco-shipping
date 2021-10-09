
import 'package:pasco_shipping/utils/logger/logger.dart';


class AirwaybillResponse {
  AirwaybillResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<AirwaybillModel>? data;

  AirwaybillResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <AirwaybillModel>[];
      try {
        data = List<AirwaybillModel>.from(json['Data'].map((x) => AirwaybillModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class AirwaybillModel {
  AirwaybillModel({
    this.id,
    this.type,
    this.airwaybillNumber,
    this.status,
    this.clientUserName,


    this.subcontractName,
    this.shipperName,
    this.consigneeName,
    this.carrierName,
    this.specificationName,
    this.shipmentID,
    this.portName,
    this.location,
    this.weight,


    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser,
  required  this.used
  });

  int? id;
  String? type;
  String? airwaybillNumber;
  String? status;
  String? clientUserName;

  String? subcontractName;
  String? consigneeName;
  String? shipperName;
  String? carrierName;
  String? specificationName;
  String? portName;
  String? location;
  String? weight;
  int? shipmentID;




  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;

  bool used;


  factory AirwaybillModel.fromJson(Map<String, dynamic> json) => AirwaybillModel(
    id: json['id'],
    type: json['type'],
    status: json['status'],
    airwaybillNumber:json['airwaybillNumber'] ,
    clientUserName: json['clientUserName'],

    subcontractName: json['subcontractName'],
    shipperName: json['shipperName'],
    consigneeName: json['consigneeName'],
    carrierName: json['carrierName'],
    specificationName: json['specificationName']??'',
    shipmentID: json['shipmentID'],
    used: json['used'],
    location: json['location'],
    portName: json['portName'],
    weight: json['weight'].toString(),




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









