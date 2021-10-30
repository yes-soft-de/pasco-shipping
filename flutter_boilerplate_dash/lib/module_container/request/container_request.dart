class ContainerRequest {
  int? id;

  int specificationID;
  String? containerNumber;
  String status;
  String type;
  String location;
  String? consignee;


  int? shipperID;
  int? consigneeID;
  int providedBy;
  int? carrierID;
  int? clientID;
  int portID;
  int? exportCountryID;
  int? exportWarehouseID;
  String? exportCity;

  ContainerRequest(
      {
        this.id,
      required this.type,
      required this.specificationID,
       this.containerNumber,
        required this.status,
       this.consigneeID,
       required this.providedBy,
         this.carrierID,
      required this.shipperID,
        this.clientID,
       required this.portID,
      required  this.location,
        this.consignee,
        this.exportWarehouseID,

        this.exportCountryID,
        this.exportCity

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
        'status': status,
        'location':location,
        'portID':portID,
        'exportCountryID':exportCountryID,
        'exportCity':exportCity,
        'exportWarehouseID':exportWarehouseID,
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
        'clientUserID': clientID,
        'status': status,
        'location':location,
        'portID':portID,
        'consignee':consignee,
        'exportCountryID':exportCountryID,
        'exportCity':exportCity,
        'exportWarehouseID':exportWarehouseID
      };
    }
  }
}
