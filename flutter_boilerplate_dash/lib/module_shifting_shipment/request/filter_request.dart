class ShiftingShipmentFilterRequest {
  int? fromImportWarehouseID;
  int? toImportWarehouseID;
  String? status;

  ShiftingShipmentFilterRequest({
      this.fromImportWarehouseID, this.toImportWarehouseID, this.status });

  Map<String, dynamic> toJson() {
    return {
      'fromImportWarehouseID':fromImportWarehouseID,
      'toImportWarehouseID':toImportWarehouseID,
      'status':status
    };
  }
}