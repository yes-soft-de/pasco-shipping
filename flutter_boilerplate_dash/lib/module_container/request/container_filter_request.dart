class ContainerFilterRequest {
  String? type;
  String? containerNumber;
  String? status;

  int? providedBy;
  int? shipperID;
  int? consigneeID;

  ContainerFilterRequest({
    this.type,
    this.containerNumber,
    this.status,
    this.providedBy,
    this.consigneeID,
    this.shipperID,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type ?? '',
      'status': status ?? '',
      'shipperID': shipperID ?? '',
      'consigneeID': consigneeID ?? '',
      'providedBy': providedBy ?? '',
      'containerNumber':containerNumber ??''
    };
  }
}
