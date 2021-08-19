import 'package:pasco_shipping/utils/logger/logger.dart';

class WaitingShipmentResponse {
  WaitingShipmentResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  Data? data;

  WaitingShipmentResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      try {
        data = Data.fromJson(json['Data']);
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }
}

class Data{
  Data({this.data , this.totalCount});
  int? totalCount;
List<WaitingShipmentModel>? data;

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['shipments'] != null) {
      data = <WaitingShipmentModel>[];
      try {
        data = List<WaitingShipmentModel>.from(json['shipments'].map((x) => WaitingShipmentModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }
}

class WaitingShipmentModel {
  WaitingShipmentModel({
    this.shipmentId,
    this.clientUsername,
    this.statusDetails,
    this.target,
    this.supplierName,
    this.distributorName,
    this.exportWarehouseName,
    this.importWarehouseName,
    this.quantity,
    this.updatedAt,
    this.productCategoryName,
    this.unit,
    this.receiverName,
    this.receiverPhoneNumber,
    this.paymentTime,
    this.vehicleIdentificationNumber,
    this.extraSpecification,
    this.transportationType,
    this.markNumber,
    this.holderType,
    this.imagePath,
    this.externalWarehouseInfo,
    required this.isExternalWarehouse
  });

  int? shipmentId;
  String? clientUsername;
  String? statusDetails;

  String? target;

  String? supplierName;
  String? distributorName;
  String? exportWarehouseName;
  String? importWarehouseName;
  int? quantity;
  DateTime? updatedAt;
  String? productCategoryName;
  String? unit;
  String? receiverName;
  String? receiverPhoneNumber;

  String? paymentTime;

  String? transportationType;
  String? markNumber;

  String? vehicleIdentificationNumber;
  String? extraSpecification;

  String? holderType;
  String? imagePath;

  bool isExternalWarehouse;
  String? externalWarehouseInfo;

  DateTime? createdAt;
  String? updatedByUser;

  factory WaitingShipmentModel.fromJson(Map<String, dynamic> json) =>
      WaitingShipmentModel(
        shipmentId: json["id"],
        clientUsername: json["clientUsername"],
        statusDetails: json["statusDetails"],
        target: json["target"],
        supplierName: json["supplierName"],
        distributorName: json["distributorName"],
        exportWarehouseName: json["exportWarehouseName"],
        importWarehouseName: json["importWarehouseName"],
        quantity: json["quantity"],
        updatedAt: DateTime.fromMillisecondsSinceEpoch(
            CreatedAt.fromJson(json["updatedAt"]).timestamp! * 1000),
        productCategoryName: json["productCategoryName"],
        unit: json["unit"],
        receiverName: json["receiverName"],
        receiverPhoneNumber: json["receiverPhoneNumber"],
        paymentTime: json["paymentTime"],
        vehicleIdentificationNumber: json["vehicleIdentificationNumber"],
        extraSpecification: json["extraSpecification"],

        transportationType : json['transportationType'],
        markNumber: json['markNumber'],
        holderType: json['holderType'],
        imagePath:json['image'],
        isExternalWarehouse: json['isExternalWarehouse'],
        externalWarehouseInfo: json['externalWarehouseInfo'] ??''


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
