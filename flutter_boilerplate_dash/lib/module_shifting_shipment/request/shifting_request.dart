class ShiftingRequest {
  int shipmentID ;
  String trackNumber;
  int fromImportWarehouseID;
  int toImportWarehouseID;
  String? notes;

  ShiftingRequest(
  {required this.shipmentID,required this.trackNumber,required this.fromImportWarehouseID,
    required  this.toImportWarehouseID, this.notes });

  Map<String, dynamic> toJson() {
    return {
      'shipmentID':shipmentID,
      'trackNumber':trackNumber,
      'fromImportWarehouseID':fromImportWarehouseID,
      'toImportWarehouseID':toImportWarehouseID,
      'notes':notes
    };
  }
}