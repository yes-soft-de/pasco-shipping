import 'package:pasco_shipping/utils/logger/logger.dart';

class ShipmentShiftingResponse {
  ShipmentShiftingResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<ShipmentShiftingModel>? data;

  ShipmentShiftingResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <ShipmentShiftingModel>[];
      try {
        data = List<ShipmentShiftingModel>.from(json['Data'].map((x) => ShipmentShiftingModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class ShipmentShiftingModel {
  ShipmentShiftingModel({
    this.id,
    this.shipmentID,
    this.trackNumber,
    this.status,
    this.notes,
   required this.fromImportWarehouseCity,
  required  this.fromImportWarehouseName,
   required this.toImportWarehouseCity,
   required this.toImportWarehouseName,


    this.createdAt,
    this.updatedAt,

  });

  int? id;
  int? shipmentID;
  String? trackNumber;
  String? notes;
  String? status;

  String fromImportWarehouseName;
  String fromImportWarehouseCity;

  String toImportWarehouseCity;
  String toImportWarehouseName;


  DateTime? createdAt;
  DateTime? updatedAt;



  factory ShipmentShiftingModel.fromJson(Map<String, dynamic> json) => ShipmentShiftingModel(
    id: json['id'],
    shipmentID: json['shipmentID'],
    trackNumber: json['trackNumber'],

    status: json['status'],
    notes: json['notes'],
    fromImportWarehouseCity: json['fromImportWarehouseCity'],
    toImportWarehouseName: json['toImportWarehouseName'],
    fromImportWarehouseName: json['fromImportWarehouseName']??'',
    toImportWarehouseCity: json['toImportWarehouseCity'],



    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),

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