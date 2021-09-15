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


  AirwaybillFilterRequest({
    this.type,
    this.airwaybillNumber,
    this.status,
    this.providedBy,
    this.consigneeID,
    this.shipperID,
    this.isExternalWarehouse,
    this.shipmentID,
    this.clientUserID
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
      'clientUserID':clientUserID
    };
  }
}
