import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';
import 'package:pasco_shipping/utils/logger/logger.dart';

class AcceptedShipmentDetailsResponse {
  AcceptedShipmentDetailsResponse({
    this.statusCode,
    this.msg,
    this.acceptedShipmentModel,
  });

  String? statusCode;
  String? msg;
  AcceptedShipmentDetailsModel? acceptedShipmentModel;

  AcceptedShipmentDetailsResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    acceptedShipmentModel = AcceptedShipmentDetailsModel.fromJson(json['Data']);
  }
}

class AcceptedShipmentDetailsModel {
  AcceptedShipmentDetailsModel({
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
    this.paymentTime,
    this.vehicleIdentificationNumber,
    this.extraSpecification,
    this.transportationType,
    this.markNumber,
    this.imagePath,
    this.updatedByUser,
    this.subShipmentModelList
  });

  int? shipmentId;
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

  String? paymentTime;

  String? transportationType;
  String? markNumber;

  String? vehicleIdentificationNumber;
  String? extraSpecification;
  List<ImagePa>? imagePath;

  DateTime? createdAt;
  String? updatedByUser;
  List<SubShipmentModel> ? subShipmentModelList;

  AcceptedShipmentDetailsModel.fromJson(Map<String, dynamic> json) {
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
    paymentTime= json["paymentTime"];
    vehicleIdentificationNumber= json["vehicleIdentificationNumber"];
    extraSpecification= json["extraSpecification"];

    transportationType = json['transportationType'];
    markNumber=json['markNumber'];

    imagePath=List<ImagePa>.from(json['images'].map((x) => ImagePa.fromJson(x)));
    updatedByUser = json['orderUpdatedByUser'];

    if (json['tracks'] != null) {
      subShipmentModelList = <SubShipmentModel>[];
      try {
        subShipmentModelList = List<SubShipmentModel>.from(json['tracks'].map((x) => SubShipmentModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }


  }

}

class SubShipmentModel {
  String? shipmentStatus;
  String? trackNumber;

  SubShipmentModel({this.shipmentStatus , this.trackNumber});
  factory SubShipmentModel.fromJson(Map<String, dynamic> json) =>
      SubShipmentModel(
          shipmentStatus: json['shipmentStatus'],
          trackNumber :  json['trackNumber']
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
