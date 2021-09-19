
import 'package:pasco_shipping/utils/logger/logger.dart';


class ContainerResponse {
  ContainerResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<ContainerModel>? data;

  ContainerResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <ContainerModel>[];
      try {
        data = List<ContainerModel>.from(json['Data'].map((x) => ContainerModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class ContainerModel {
  ContainerModel({
    this.id,
    this.type,
    this.containerNumber,
    this.status,
    this.clientUserName,
    this.subcontractName,
    this.shipperName,
    this.consigneeName,
    this.specificationName,
    this.carrierName,
    this.shipmentID,


    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser,
   required this.used
  });

  int? id;
  String? type;
  String? containerNumber;
  String? status;
  String? clientUserName;
  String? subcontractName;
  String? consigneeName;
  String? shipperName;
  String? specificationName;
  String? carrierName;

  int? shipmentID;




  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;

  bool used;


  factory ContainerModel.fromJson(Map<String, dynamic> json) => ContainerModel(
    id: json['id'],
    type: json['type']??'',
    status: json['status']??'',
    containerNumber:json['containerNumber'] ??'',
    clientUserName: json['clientUserName'],
    subcontractName: json['subcontractName']??'',
    shipperName: json['shipperName']??'',
    consigneeName: json['consigneeName']??'',
    carrierName: json['carrierName']??'',
    specificationName: json['specificationName']??'',
    shipmentID: json['shipmentID'],
    used: json['used'],





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









