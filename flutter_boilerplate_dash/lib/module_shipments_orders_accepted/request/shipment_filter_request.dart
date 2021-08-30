class AcceptedShipmentFilterRequest{
  String? trackNumber;
  String? transportationType;
  String? status;
  bool? isExternalWarehouse;
  int? exportWarehouseID;
  int? importWarehouseID;


  AcceptedShipmentFilterRequest({  this.transportationType, this.trackNumber , this.status , this.isExternalWarehouse , this.exportWarehouseID , this.importWarehouseID});

  Map<String, dynamic> toJson() => {
    'trackNumber':trackNumber ??'',
    'status':status ??'',
    'transportationType':transportationType,
    'isExternalWarehouse':isExternalWarehouse,
    'exportWarehouseID':exportWarehouseID,
    'importWarehouseID':importWarehouseID
  };
}