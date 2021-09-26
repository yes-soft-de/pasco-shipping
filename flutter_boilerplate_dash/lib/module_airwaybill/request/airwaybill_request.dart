class AirwaybillRequest {
  int? id;

  int specificationID;
  String? airwaybillNumber;
  String status;
  String type;
  String location;


  int? shipperID;
  int? consigneeID;
  int? providedBy;
  int? carrierID;
  int? clientID;
  int portID;

  AirwaybillRequest(
      {
        this.id,
      required this.type,
      required this.specificationID,
       this.airwaybillNumber,
        required this.status,
      required  this.location,

      required this.consigneeID,
      required this.providedBy,
        required this.carrierID,
      required this.shipperID,
        this.clientID,
       required this.portID

      });

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {
        'type': type,
        'airwaybillNumber':airwaybillNumber,
        'specificationID': specificationID,
        'providedBy': providedBy,
        'consigneeID': consigneeID,
        'shipperID': shipperID,
        'carrierID': carrierID,
        'clientUserID': clientID,
        'status': status,
        'portID':portID,
        'location':location
      };
    } else {
      return {
        'id': id,
        'type': type,
        'airwaybillNumber':airwaybillNumber,
        'specificationID': specificationID,
        'providedBy': providedBy,
        'consigneeID': consigneeID,
        'shipperID': shipperID,
        'carrierID': carrierID,
        'clientUserID': clientID,
        'status': status,
        'portID':portID,
        'location':location
      };
    }
  }
}
