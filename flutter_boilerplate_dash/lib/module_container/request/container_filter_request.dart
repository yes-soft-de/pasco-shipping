class ContainerFilterRequest {
  String? type;
  String? containerNumber;
  String? status;

  int? providedBy;
  int? shipperID;
  int? consigneeID;
  int? specificationID;
  int? shipmentID;
  int? clientUserID;
  int? containerID;

  bool? isExternalWarehouse;
  bool? withoutNumber;
  bool? isRequested;

  ContainerFilterRequest({
    this.type,
    this.containerNumber,
    this.status,
    this.providedBy,
    this.consigneeID,
    this.shipperID,
    this.specificationID,
    this.isExternalWarehouse,
    this.shipmentID,
    this.containerID,
    this.clientUserID,this.isRequested,this.withoutNumber

  });

  Map<String, dynamic> toJson() {
    return {
      'type': type ?? '',
      'status': status ?? '',
      'shipperID': shipperID ?? 0,
      'consigneeID': consigneeID ?? 0,
      'providedBy': providedBy ?? 0,
      'specificationID': specificationID ?? 0,
      'containerNumber':containerNumber ??'',
      'isExternalWarehouse':isExternalWarehouse,
      'shipmentID':shipmentID,
      'clientUserID':clientUserID,
      'id':containerID,
      'isRequested':isRequested,
      'withoutNumber':withoutNumber
    };
  }
}
