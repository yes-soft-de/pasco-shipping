class ContainerFilterRequest {
  String? type;
  String? containerNumber;
  String? status;

  int? providedBy;
  int? shipperID;
  int? consigneeID;
  int? specificationID;

  bool? isExternalWarehouse;

  ContainerFilterRequest({
    this.type,
    this.containerNumber,
    this.status,
    this.providedBy,
    this.consigneeID,
    this.shipperID,
    this.specificationID,
    this.isExternalWarehouse

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
      'isExternalWarehouse':isExternalWarehouse
    };
  }
}
