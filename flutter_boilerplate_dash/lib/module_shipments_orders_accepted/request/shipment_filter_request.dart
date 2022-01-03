class AcceptedShipmentFilterRequest{
  String? trackNumber;
  String? transportationType;
  String? status;
  bool? isExternalWarehouse;
  int? exportWarehouseID;
  int? importWarehouseID;
  int? clientUserID;

  String? paymentTime;
  String? orderStatus;
  // String? launchCountry;
  String? targetCountry;

  String? dateOne;
  String? dateTow;

  String? containerNumber;
  String? airWaybillNumber;


  bool acceptedUntilCleared;

  AcceptedShipmentFilterRequest({required this.acceptedUntilCleared,
    this.transportationType, this.trackNumber , this.status ,
    this.orderStatus,
    this.isExternalWarehouse , this.exportWarehouseID , this.importWarehouseID , this.airWaybillNumber , this.dateTow , this.dateOne , this.paymentTime , this.targetCountry , this.containerNumber , this.clientUserID});

  Map<String, dynamic> toJson() => {
    'trackNumber':trackNumber ==''?null:trackNumber,
    'status':status ==''?null :status,
    'transportationType':transportationType,
    'isExternalWarehouse':isExternalWarehouse,
    'exportWarehouseID':exportWarehouseID,
    'importWarehouseID':importWarehouseID,
    'orderStatus':orderStatus ?? 'accepted',

    'targetCountry':targetCountry ==''? null:targetCountry,
    // 'launchCountry':launchCountry,
    'paymentTime':paymentTime == ''?null : paymentTime,

    'dateOne':dateOne ==''?null : dateOne,
    'dateTow':dateTow == ''?null :dateTow,
    'containerNumber':containerNumber == ''?null:containerNumber ,
    'airWaybillNumber':airWaybillNumber =='' ? null :airWaybillNumber,
    'clientUserID':clientUserID,
    'acceptedUntilCleared':acceptedUntilCleared
  };
}