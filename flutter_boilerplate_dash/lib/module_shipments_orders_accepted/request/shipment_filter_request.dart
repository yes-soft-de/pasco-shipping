class AcceptedShipmentFilterRequest{
  String? trackNumber;
  String? transportationType;
  String? status;
  bool? isExternalWarehouse;
  int? exportWarehouseID;
  int? importWarehouseID;
  int? clientUserID;

  String? paymentTime;
  // String? launchCountry;
  String? targetCountry;

  String? dateOne;
  String? dateTow;

  String? containerNumber;
  String? airWaybillNumber;



  AcceptedShipmentFilterRequest({  this.transportationType, this.trackNumber , this.status , this.isExternalWarehouse , this.exportWarehouseID , this.importWarehouseID , this.airWaybillNumber , this.dateTow , this.dateOne , this.paymentTime , this.targetCountry , this.containerNumber , this.clientUserID});

  Map<String, dynamic> toJson() => {
    'trackNumber':trackNumber ??'',
    'status':status ??'',
    'transportationType':transportationType,
    'isExternalWarehouse':isExternalWarehouse,
    'exportWarehouseID':exportWarehouseID,
    'importWarehouseID':importWarehouseID,


    'targetCountry':targetCountry,
    // 'launchCountry':launchCountry,
    'paymentTime':paymentTime,

    'dateOne':dateOne,
    'dateTow':dateTow,
    'containerNumber':containerNumber,
    'airWaybillNumber':airWaybillNumber,
    'clientUserID':clientUserID
  };
}