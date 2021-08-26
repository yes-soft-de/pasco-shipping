import 'package:pasco_shipping/utils/logger/logger.dart';

class AcceptedShipmentResponse {
  AcceptedShipmentResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  Data? data;

  AcceptedShipmentResponse.fromJson(Map<String, dynamic> json) {
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
  Data({this.data ,this.statistics, this.totalCount});
  int? totalCount;
  Statistics? statistics;
  List<AcceptedShipmentModel>? data;

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    statistics = Statistics.fromJson(json['statistics']);
    if (json['shipments'] != null) {
      data = <AcceptedShipmentModel>[];
      try {
        data = List<AcceptedShipmentModel>.from(json['shipments'].map((x) => AcceptedShipmentModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }
}
class AcceptedShipmentModel {
  AcceptedShipmentModel({
    this.shipmentId,
    this.clientUsername,
    this.target,
    this.supplierName,
    this.distributorName,
    this.exportWarehouseName,
    this.importWarehouseName,
    this.quantity,
    this.updatedAt,
    this.productCategoryName,
    this.subProductCategoryName,
    this.unit,
    this.receiverName,
    this.receiverPhoneNumber,
    this.clientIdentificationNumber,
    this.paymentTime,
    this.vehicleIdentificationNumber,
    this.extraSpecification,
    this.transportationType,
    this.markNumber,
    this.imagePath,
    this.updatedByUser,
    // this.subShipmentModelList
  });

  String? shipmentId;
  String? clientUsername;
  String? target;

  String? supplierName;
  String? distributorName;
  String? exportWarehouseName;
  String? importWarehouseName;
  int? quantity;
  DateTime? updatedAt;
  String? productCategoryName;
  String? subProductCategoryName;
  String? unit;
  String? receiverName;
  String? receiverPhoneNumber;
  String? clientIdentificationNumber;

  String? paymentTime;

  String? transportationType;
  String? markNumber;

  String? vehicleIdentificationNumber;
  String? extraSpecification;
  String? imagePath;

  DateTime? createdAt;
  String? updatedByUser;
  // List<SubShipmentModel> ? subShipmentModelList;

  AcceptedShipmentModel.fromJson(Map<String, dynamic> json) {
        shipmentId = json["id"];
        clientUsername= json['clientUsername'];
        target= json["target"];
        supplierName= json["supplierName"];
        distributorName= json["distributorName"];
        exportWarehouseName=json["exportWarehouseName"];
        importWarehouseName= json["importWarehouseName"];
        quantity= json["quantity"];
        updatedAt= DateTime.fromMillisecondsSinceEpoch(
            CreatedAt.fromJson(json["updatedAt"]).timestamp! * 1000);
        productCategoryName= json["productCategoryName"];
        subProductCategoryName= json["subProductCategoryName"];
        unit= json["unit"];
        receiverName= json["receiverName"];
        receiverPhoneNumber= json["receiverPhoneNumber"];
        clientIdentificationNumber= json["clientIdentificationNumber"];
        paymentTime= json["paymentTime"];
        vehicleIdentificationNumber= json["vehicleIdentificationNumber"];
        extraSpecification= json["extraSpecification"];

        transportationType = json['transportationType'];
        markNumber=json['markNumber'];

        imagePath=json['image'];
        updatedByUser = json['orderUpdatedByUser'];
  }

}

class Statistics{
  Statistics({this.received , this.notDelivered , this.delivered});
  int? received;
  int? notDelivered;
  int? delivered;
  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    received: json['received'],
    notDelivered: json['notDelivered'],
    delivered: json['delivered'],
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
