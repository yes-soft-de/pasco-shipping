import 'package:pasco_shipping/utils/logger/logger.dart';

class ContainerDetailsResponse {
  ContainerDetailsResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  ContainerDetailsModel? data;

  ContainerDetailsResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = ContainerDetailsModel(shipments: []);
      try {
        data = ContainerDetailsModel.fromJson(json['Data']);
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class ContainerDetailsModel {
  ContainerDetailsModel({
    this.id,
    this.type,
    this.containerNumber,
    this.status,

    this.subcontractName,
    this.shipperName,
    this.consigneeName,
    this.carrierName,
    this.specificationName,
    this.freeCapacity,
    this.shipmentID,
    this.portName,
    this.location,
    this.shippingStatus,


    this.createdAt,
    this.updatedAt,
    this.updatedByUser,

   required this.shipments
  });

  int? id;
  String? type;
  String? containerNumber;
  String? status;

  String? subcontractName;
  String? consigneeName;
  String? shipperName;
  String? carrierName;
  String? specificationName;
  String? freeCapacity;
  String? portName;
  String? location;
  String? shippingStatus;

  int? shipmentID;



  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;

  List<ShipmentModel> shipments;

  factory ContainerDetailsModel.fromJson(Map<String, dynamic> json) => ContainerDetailsModel(
    id: json['id'],
    type: json['type'],
    status: json['status'],
    containerNumber: json['containerNumber'],

    subcontractName: json['subcontractName'],
    consigneeName: json['consigneeName'],
    shipperName: json['shipperName'],
    carrierName: json['carrierName'],
    specificationName: json['specificationName'],
    freeCapacity: json['freeCapacity'].toString(),
    shipmentID: json['shipmentID'],
    portName: json['portName'],
    location: json['location'],
    shippingStatus: json['shippingStatus'],




    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    updatedByUser: json['createdByUser'],

    shipments: List<ShipmentModel>.from(json['shipments'].map((x) => ShipmentModel.fromJson(x))),

  );
}


class ShipmentModel {
  ShipmentModel({
    this.id,
    this.shipmentId,
    this.shipmentStatus,
    this.trackNumber,
    this.isInOneHolder,
    this.packed,
    this.transportationType,
    this.target,
    this.supplierName,
    this.distributorName,
    this.exportWarehouseName,
    this.importWarehouseName,
    this.quantity,
    this.image,
    this.productCategoryName,
    this.subProductCategoryName,
    this.unit,
    this.receiverName,
    this.receiverPhoneNumber,
    this.markNumber,
    this.packetingBy,
    this.paymentTime,
    this.weight,
    this.volume,
    this.qrCode,
    this.guniQuantity,
    this.vehicleIdentificationNumber,
    this.extraSpecification,
    this.isExternalWarehouse,
    this.travelID,
    this.travelStatus,
    this.categoriesNames,

    this.updatedAt,
    this.createdAt,
    this.createdBy,
    this.updatedBy
  });

  int? id;
  int? shipmentId;
  String? shipmentStatus;
  String? trackNumber;
  bool? isInOneHolder;
  bool? packed;
  String? transportationType;
  String? target;
  String? supplierName;
  String? categoriesNames;
  String? distributorName;
  String? exportWarehouseName;
  String? importWarehouseName;
  int? quantity;
  String? image;
  String? productCategoryName;
  String? subProductCategoryName;
  String? unit;
  String? receiverName;
  String? receiverPhoneNumber;
  String? markNumber;
  int? packetingBy;
  String? paymentTime;
  String? weight;
  String? volume;
  String? qrCode;
  int? guniQuantity;
  String? vehicleIdentificationNumber;
  String? extraSpecification;
  bool? isExternalWarehouse;
  int? travelID;
  String? travelStatus;



  DateTime? createdAt;
  DateTime? updatedAt;
  int? createdBy;
  String? updatedBy;

  factory ShipmentModel.fromJson(Map<String, dynamic> json) => ShipmentModel(
    id: json["id"],
    shipmentId: json["shipmentID"],
    shipmentStatus: json["shipmentStatus"],
    trackNumber: json["trackNumber"],
    isInOneHolder: json["isInOneHolder"],
    packed: json["packed"],
    transportationType: json["transportationType"],
    target: json["target"],
    supplierName: json["supplierName"],
    distributorName: json["distributorName"],
    exportWarehouseName: json["exportWarehouseName"] ?? json['externalWarehouseInfo'],
    importWarehouseName: json["importWarehouseName"],
    quantity: json["quantity"],
    image: json["image"],
    productCategoryName: json["productCategoryName"],
    subProductCategoryName: json["subProductCategoryName"],
    unit: json["unit"],
    receiverName: json["receiverName"],
    receiverPhoneNumber: json["receiverPhoneNumber"],
    markNumber: json["markNumber"],
    packetingBy: json["packetingBy"],
    paymentTime: json["paymentTime"],
    weight: json["weight"].toString(),
    volume: json["volume"].toString(),
    qrCode: json["qrCode"],
    categoriesNames: json['categoriesNames'],
    guniQuantity: json["guniQuantity"] ??0,
    vehicleIdentificationNumber: json["vehicleIdentificationNumber"],
    extraSpecification: json["extraSpecification"],
    isExternalWarehouse: json["isExternalWarehouse"],
    travelID: json['travelID'],
    travelStatus: json['travelStatus'],


    createdAt:DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt:DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
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