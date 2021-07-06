import 'dart:io';
class AddShipmentRequest {
   String transportationType;

   int exportWarehouseID;
   String target;

   int productCategoryID;

   int quantity;

   String supplierName;

   String receiverName;
   String receiverPhoneNumber;

   String unit;

   int markId;


   String paymentTime;

   String vehicleIdentificationNumber;
   String extraSpecification;

   String? imageFile;


  Map<String, dynamic> toJson() => {
    "transportationType": transportationType,
    "target": target,
    "supplierName": supplierName,
    "quantity": quantity,
    "productCategoryID": productCategoryID,

    "unit": unit,
    "receiverName": receiverName,
    "receiverPhoneNumber": receiverPhoneNumber,
    "paymentTime": paymentTime,
    "exportWarehouseID": exportWarehouseID,
    "markId": markId,
    "vehicleIdentificationNumber": vehicleIdentificationNumber,
    "extraSpecification": extraSpecification,
    'image': imageFile,
  };

   AddShipmentRequest({
    required  this.transportationType,
     required this.exportWarehouseID,
     required  this.target,
     required     this.productCategoryID,
     required this.quantity,
     required   this.supplierName,
     required  this.receiverName,
     required this.receiverPhoneNumber,
     required this.unit,
     required this.markId,
     required this.paymentTime,
     required this.vehicleIdentificationNumber,
     required  this.extraSpecification,
      this.imageFile});
}