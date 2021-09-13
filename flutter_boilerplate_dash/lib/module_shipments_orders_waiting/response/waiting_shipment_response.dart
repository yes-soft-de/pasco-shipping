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
    this.holderType,
    this.imagePath,
    this.externalWarehouseInfo,
    required this.isExternalWarehouse,
   required this.pendingHolders
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

  String? holderType;
  List<ImagePa>? imagePath;

  bool isExternalWarehouse;
  String? externalWarehouseInfo;

  DateTime? createdAt;
  String? updatedByUser;
  List<PendingHolders> pendingHolders;

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
          subProductCategoryName: json["subProductCategoryName"],
        unit: json["unit"],
        receiverName: json["receiverName"],
        receiverPhoneNumber: json["receiverPhoneNumber"],
          clientIdentificationNumber: json["clientIdentificationNumber"],
        paymentTime: json["paymentTime"],
        vehicleIdentificationNumber: json["vehicleIdentificationNumber"],
        extraSpecification: json["extraSpecification"],

        transportationType : json['transportationType'],
        markNumber: json['markNumber'],
        holderType: json['holderType'],
        imagePath: List<ImagePa>.from(json['images'].map((x) => ImagePa.fromJson(x))),
        isExternalWarehouse: json['isExternalWarehouse'],
        externalWarehouseInfo: json['externalWarehouseInfo'] ??'',
        pendingHolders:List<PendingHolders>.from(json['pendingHolders'].map((x) => PendingHolders.fromJson(x))),


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
class ImagePa {
  ImagePa({
  required  this.id,
    required this.url,
  });
  int id;
  String url;

  factory ImagePa.fromJson(Map<String, dynamic> json) => ImagePa(
    id: json['id'],
    url: json['image'],
  );
}

class PendingHolders {
  int? id;
  int? shipmentID;
  int? specificationID;
  String? specificationName;
  String? notes;

  PendingHolders({required this.id,required this.shipmentID,required this.specificationID,
     required this.specificationName, this.notes});

  PendingHolders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shipmentID = json['shipmentID'];
    specificationID = json['specificationID'];
    specificationName = json['specificationName'];
    notes = json['notes'];
  }
}