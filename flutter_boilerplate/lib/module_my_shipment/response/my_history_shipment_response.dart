import 'package:pasco_shipping/utils/logger/logger.dart';

class MyHistoryShipmentResponse {
  MyHistoryShipmentResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<MyHistoryShipment>? data;

  MyHistoryShipmentResponse.fromJson(Map<String, dynamic> json) {
    try {
      statusCode = json['status_code'];
      msg = json['msg'];
      if (json['Data'] != null) {
        data = List<MyHistoryShipment>.from(
            json["Data"].map((x) => MyHistoryShipment.fromJson(x)));
      }
    } catch (e) {
      Logger()
          .error('HistoryShipment Response', e.toString(), StackTrace.current);
      statusCode = '-1';
    }
  }
}

class MyHistoryShipment {
  MyHistoryShipment(
      {this.shipmentId,
      this.trackNumber,
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
      this.externalWarehouseInfo,
      this.isExternalWarehouse,
      this.imagePath});

  int? shipmentId;
  String? trackNumber;
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
  String? externalWarehouseInfo;
  bool? isExternalWarehouse;
  String? imagePath;

  factory MyHistoryShipment.fromJson(Map<String, dynamic> json) =>
      MyHistoryShipment(
        shipmentId: json["shipmentID"],
        trackNumber: json["trackNumber"],
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
        transportationType: json['transportationType'],
        markNumber: json['markNumber'],
        holderType: json['holderType'],
        isExternalWarehouse: json['isExternalWarehouse'],
        externalWarehouseInfo: json['externalWarehouseInfo'],
        imagePath: json['image'],
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
