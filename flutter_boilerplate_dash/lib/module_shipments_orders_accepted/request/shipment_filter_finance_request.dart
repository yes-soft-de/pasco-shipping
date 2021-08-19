class ShipmentFilterFinanceRequest {
  int shipmentID;
  String trackNumber;
  String? shipmentStatus;
  int? importWarehouseID;
  int? exportWarehouseID;

  ShipmentFilterFinanceRequest(
      {required this.shipmentID,
        required this.trackNumber,
         this.importWarehouseID,
         this.exportWarehouseID,
         this.shipmentStatus,
        });
  Map<String, dynamic> toJson() {
    if (shipmentID == null) {
      return {
        'trackNumber': trackNumber,
        'exportWarehouseID': exportWarehouseID,
        'importWarehouseID': importWarehouseID,
        'shipmentStatus': shipmentStatus,
      };
    } else {
      return {
        'shipmentID': shipmentID,
        'trackNumber': trackNumber,
        'exportWarehouseID': exportWarehouseID,
        'importWarehouseID': importWarehouseID,
        'shipmentStatus': shipmentStatus,
      };
    }
  }
}
