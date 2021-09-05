class AirwaybillFilterRequest {
  String? type;
  String? airwaybillNumber;
  String? status;

  int? providedBy;
  int? shipperID;
  int? consigneeID;

  bool? isExternalWarehouse;


  AirwaybillFilterRequest({
    this.type,
    this.airwaybillNumber,
    this.status,
    this.providedBy,
    this.consigneeID,
    this.shipperID,
    this.isExternalWarehouse
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
    };
  }
}
