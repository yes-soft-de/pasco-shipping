class AirwaybillFilterRequest {
  String? type;
  String? airwaybillNumber;
  String? status;

  int? providedBy;
  int? shipperID;
  int? consigneeID;
  int? shipmentID;
  int? clientUserID;

  bool? isExternalWarehouse;
  bool? isRequested;
  bool? withoutNumber;


  AirwaybillFilterRequest({
    this.type,
    this.airwaybillNumber,
    this.status,
    this.providedBy,
    this.consigneeID,
    this.shipperID,
    this.isExternalWarehouse,
    this.shipmentID,
    this.clientUserID,
    this.withoutNumber,
    this.isRequested
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type ?? '',
      'status': status ?? '',
      'shipperID': shipperID ?? '',
      'consigneeID': consigneeID ?? '',
      'providedBy': providedBy ?? '',
      'airwaybillNumber':airwaybillNumber ??'',
      'isExternalWarehouse':isExternalWarehouse,
      'shipmentID':shipmentID,
      'clientUserID':clientUserID,
      'isRequested':isRequested,
      'withoutNumber':withoutNumber
    };
  }
}
