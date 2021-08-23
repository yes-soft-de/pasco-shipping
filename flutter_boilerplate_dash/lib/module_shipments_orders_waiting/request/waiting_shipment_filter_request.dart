class WaitingShipmentFilterRequest {
  bool isExternalWarehouse;
  String transportationType;
  int? exportWarehouseID;

  WaitingShipmentFilterRequest({
   required   this.isExternalWarehouse,
   required this.transportationType,
    this.exportWarehouseID
  });

  Map<String, dynamic> toJson() {
    return {
      'transportationType': transportationType,
      'isExternalWarehouse': isExternalWarehouse ,
      'exportWarehouseID':exportWarehouseID
    };
  }
}