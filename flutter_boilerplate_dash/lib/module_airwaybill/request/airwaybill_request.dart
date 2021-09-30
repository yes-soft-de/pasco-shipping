class AirwaybillRequest {
  int? id;

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
