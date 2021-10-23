import 'dart:io';

import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
class AddShipmentRequest {
   int? exportCountryID;
   String? exportCountryName;
   String transportationType;

   int exportWarehouseID;
   String target;

   int productCategoryID;

   int quantity;

   String supplierName;

   int receiverID;
   String receiverName;
   String receiverPhoneNumber;

   String unit;

   int markId;


   String paymentTime;

   String vehicleIdentificationNumber;
   String extraSpecification;

   String holderType;
   int? holderCount;

   bool isExternalWarehouse;
   String? externalWarehouseInfo;
   List<String>? imageFilePath;
   late List<RequestedHolders>? holders;

  Map<String, dynamic> toJson() => {
    'exportCountryID':exportCountryID,
    'exportCountryName':exportCountryName,
    "transportationType": transportationType,
    "target": target,
    "supplierName": supplierName,
    "quantity": quantity,
    "subProductCategoryID": productCategoryID,

    "unit": unit,
    "receiverID":receiverID,
    "receiverName": receiverName,
    "receiverPhoneNumber": receiverPhoneNumber,
    "paymentTime": paymentTime,
    "exportWarehouseID": exportWarehouseID,
    "markID": markId,
    "vehicleIdentificationNumber": vehicleIdentificationNumber,
    "extraSpecification": extraSpecification,
    'holderType':holderType,
    'holderCount':holderCount,
    'isExternalWarehouse':isExternalWarehouse,
    'externalWarehouseInfo':externalWarehouseInfo,

    'images': imageFilePath,
    'requestedHolders' : holders,
  };

   AddShipmentRequest({
    required  this.transportationType,
     required this.exportWarehouseID,
     required  this.target,
     required     this.productCategoryID,
     required this.quantity,
     required   this.supplierName,
     required this.receiverID,
     required  this.receiverName,
     required this.receiverPhoneNumber,
     required this.unit,
     required this.markId,
     required this.paymentTime,
     required this.vehicleIdentificationNumber,
     required  this.extraSpecification,
     required this.holderType,
     required this.holderCount,
    required this.isExternalWarehouse,
     this.externalWarehouseInfo,
     this.holders,this.exportCountryName,this.exportCountryID,

      this.imageFilePath});
}