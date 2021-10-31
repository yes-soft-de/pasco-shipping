class ContainerRequest {
  int? id;

  int specificationID;
  String? containerNumber;
  String type;
  String? consignee;
  int? shipperID;
  int? consigneeID;
  int providedBy;
  int? carrierID;
  int? clientID;

  int? portID;
  int? exportPortID;
  int? exportLocation;

  ContainerRequest(
      {
        this.id,
      required this.type,
      required this.specificationID,
       this.containerNumber,
        // required this.status,
       this.consigneeID,
       required this.providedBy,
         this.carrierID,
       this.shipperID,
        this.clientID,


        this.consignee,

        this.exportPortID,
         this.portID,
        this.exportLocation,
      });

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
        'clientUserID': clientID,

        'exportLocation':exportLocation,
        'portID':portID,
        'exportPortID':exportPortID,
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
        'carrierID': carrierID,
        'clientUserID': clientID,
        'consignee':consignee,


        'exportLocation':exportLocation,
        'portID':portID,
        'exportPortID':exportPortID,
      };
    }
  }
}
