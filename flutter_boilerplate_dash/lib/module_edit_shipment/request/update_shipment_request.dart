
class UpdateShipmentRequest {
    int id;
   int? importWarehouseID;
   int? distributorID;
   int productCategoryID;

   String unit;

   int markId;
   int receiverID;


   String paymentTime;

   String? vehicleIdentificationNumber;
   String? extraSpecification;

   // String? imageFile;


  Map<String, dynamic> toJson() => {
    "id":id,
    "productCategoryID": productCategoryID,
    "unit": unit,
    "markID": markId,
    "paymentTime": paymentTime,
    // "importWarehouseID": importWarehouseID,
    // "distributorID":distributorID,
    "receiverID":receiverID,
    "vehicleIdentificationNumber": vehicleIdentificationNumber,
    "extraSpecification": extraSpecification,

    // 'image': imageFile,
  };

   UpdateShipmentRequest({
     required this.id,
     required this.productCategoryID,
     required this.unit,
     required this.markId,
     required this.paymentTime,
     this.vehicleIdentificationNumber,
     this.extraSpecification,
      this.distributorID,
     required this.receiverID,
      this.importWarehouseID
   });
}