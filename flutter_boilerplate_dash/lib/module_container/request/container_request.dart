class ContainerRequest {
  int? id;

  int specificationID;
  String containerNumber;
  String status;
  String type;


  int shipperID;
  int consigneeID;
  int providedBy;
  int carrierID;

  ContainerRequest(
      {
        this.id,
      required this.type,
      required this.specificationID,
      required this.containerNumber,
        required this.status,

      required this.consigneeID,
      required this.providedBy,
        required this.carrierID,
      required this.shipperID});

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {
        'type': type,
        'containerNumber':containerNumber,
        'specificationID': specificationID,
        'providedBy': providedBy,
        'consigneeID': consigneeID,
        'shipperID': shipperID,
        'carrierID': carrierID,
        'status': status
      };
    } else {
      return {
        'id': id,
        'type': type,
        'containerNumber':containerNumber,
        'specificationID': specificationID,
        'providedBy': providedBy,
        'consigneeID': consigneeID,
        'shipperID': shipperID,
        'status': status,
        'carrierID': carrierID,
      };
    }
  }
}
