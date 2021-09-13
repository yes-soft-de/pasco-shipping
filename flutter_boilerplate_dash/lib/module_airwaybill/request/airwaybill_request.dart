class AirwaybillRequest {
  int? id;

  int specificationID;
  String airwaybillNumber;
  String status;
  String type;


  int shipperID;
  int consigneeID;
  int providedBy;
  int carrierID;
  int? clientID;

  AirwaybillRequest(
      {
        this.id,
      required this.type,
      required this.specificationID,
      required this.airwaybillNumber,
        required this.status,

      required this.consigneeID,
      required this.providedBy,
        required this.carrierID,
      required this.shipperID,
        this.clientID

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
        'status': status
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
        'status': status
      };
    }
  }
}
