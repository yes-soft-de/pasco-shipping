import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';
import 'package:pasco_shipping/utils/logger/logger.dart';

import 'gunny_shipment_response.dart';

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
    if(json['Data'] != null){
      try{
        acceptedShipmentModel = AcceptedShipmentDetailsModel.fromJson(json['Data']);
      }
      catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }

    }
  }
}

class AcceptedShipmentDetailsModel {
  AcceptedShipmentDetailsModel({
    this.shipmentId,
    this.clientUserID,
    this.clientUsername,
    this.target,
    this.supplierName,
    this.distributorName,
    this.exportWarehouseName,
    this.importWarehouseName,
    this.quantity,
    this.holderCount,
    this.updatedAt,
    this.remainedQuantity,
    this.productCategoryName,
    this.subProductCategoryName,
    this.unit,
    this.receiverName,
    this.receiverPhoneNumber,
    this.clientIdentificationNumber,
    this.paymentTime,
    this.vehicleIdentificationNumber,
    this.extraSpecification,
    this.holderType,
    this.transportationType,
    this.markNumber,
   required this.isExternalWarehouse,
    this.imagePath,
    this.updatedByUser,
    this.subShipmentModelList,
   required this.pendingHolders,
    this.gunnyModel,
    this.shipmentInvoiceID,
   required this.info
  });

  int? shipmentId;
  int? clientUserID;
  int? shipmentInvoiceID;
  int? remainedQuantity;
  String? clientUsername;
  String? target;

  String? supplierName;
  String? distributorName;
  String? exportWarehouseName;
  String? importWarehouseName;
  int? quantity;
  int? holderCount;
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
  bool isExternalWarehouse=false;

  String? vehicleIdentificationNumber;
  String? extraSpecification;
  String? holderType;
  List<ImagePa>? imagePath;

  DateTime? createdAt;
  String? updatedByUser;
  List<SubShipmentModel> ? subShipmentModelList;
  List<PendingHolders> pendingHolders =[];
  List<GunnyShipmentModel>? gunnyModel;
  ReceiverInfoModel info=ReceiverInfoModel();

  AcceptedShipmentDetailsModel.fromJson(Map<String, dynamic> json) {
    shipmentId = json["id"];
    clientUserID  = json["clientUserID"]??14;
    shipmentInvoiceID  = json['shipmentInvoiceID'];
    clientUsername= json['clientUsername'];
    target= json["target"];
    supplierName= json["supplierName"];
    distributorName= json["distributorName"];
    exportWarehouseName=json["exportWarehouseName"]?? json['externalWarehouseInfo'];
    importWarehouseName= json["importWarehouseName"];
    quantity= json["quantity"];
    holderCount= json["holderCount"];
    remainedQuantity = json['remainedQuantity'];
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
    holderType = json['holderType'];
    isExternalWarehouse = json['isExternalWarehouse'];

    transportationType = json['transportationType'];
    markNumber=json['markNumber'];

    imagePath=List<ImagePa>.from(json['images'].map((x) => ImagePa.fromJson(x)));
    updatedByUser = json['orderUpdatedByUser'];

    if (json['receivingInfo'] != null) {
      info = ReceiverInfoModel();
      try {
        info = ReceiverInfoModel.fromJson(json['receivingInfo']);
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
    if (json['tracks'] != null) {
      subShipmentModelList = <SubShipmentModel>[];
      try {
        subShipmentModelList = List<SubShipmentModel>.from(json['tracks'].map((x) => SubShipmentModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
    if (json['pendingHolders'] != null) {
      pendingHolders = <PendingHolders>[];
      try {
        pendingHolders = List<PendingHolders>.from(json['pendingHolders'].map((x) => PendingHolders.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
    if (json['gunny'] != null) {
      gunnyModel = <GunnyShipmentModel>[];
      try {
        gunnyModel = List<GunnyShipmentModel>.from(json['gunny'].map((x) => GunnyShipmentModel.fromJson(x)));
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
  List<StoringHolder> storingHolder=[];


  SubShipmentModel({this.shipmentStatus , this.trackNumber ,required this.storingHolder});
  SubShipmentModel.fromJson(Map<String, dynamic> json) {
          shipmentStatus= json['shipmentStatus'];
          trackNumber =  json['trackNumber'];
          if (json['holders'] != null) {
            storingHolder = <StoringHolder>[];
            try {
              storingHolder = List<StoringHolder>.from(json['holders'].map((x) => StoringHolder.fromJson(x)));
            } catch (e, stack) {
              Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
                  StackTrace.current);
            }
          }
  }
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

class ReceiverInfoModel {
  String? receivedQuantity;
  String? supplierName;
  String? notes;


  ReceiverInfoModel({this.receivedQuantity , this.supplierName ,this.notes});
  ReceiverInfoModel.fromJson(Map<String, dynamic> json) {
    receivedQuantity= json['receivedQuantity'].toString();
    supplierName =  json['supplierName'];
    notes =  json['notes'];


  }
}

class StoringHolder{
  int? holderID;
  HolderInfoShipment holderInfoShipment=HolderInfoShipment();

  StoringHolder(this.holderID, this.holderInfoShipment);

  StoringHolder.fromJson(Map<String, dynamic> json) {
    holderID= json['holderID'] ?? 0;
    if (json['holderInfo'] != null) {
      holderInfoShipment = HolderInfoShipment();
      try {
        holderInfoShipment = HolderInfoShipment.fromJson(json['holderInfo']);
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}
class HolderInfoShipment{
  String? IdentificationNumber;
  String? shippingStatus;

  HolderInfoShipment({ this.IdentificationNumber, this.shippingStatus});
  HolderInfoShipment.fromJson(Map<String, dynamic> json) {
    IdentificationNumber= json['IdentificationNumber'] ??'';
    shippingStatus =  json['shippingStatus']??'';
  }
}
