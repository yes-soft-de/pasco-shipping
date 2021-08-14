class AcceptedShipmentFilterRequest{
  String? trackNumber;
  String transportationType;
  String? status;
  bool? isExternalWarehouse;


  AcceptedShipmentFilterRequest({required  this.transportationType, this.trackNumber , this.status ,required this.isExternalWarehouse});

  Map<String, dynamic> toJson() => {
    'trackNumber':trackNumber ??'',
    'status':status ??'',
    'transportationType':transportationType,
    'isExternalWarehouse':isExternalWarehouse,
  };
}