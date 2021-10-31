class AirwaybillRequest {
  int? id;

  String? airwaybillNumber;
  String type;
  String? consignee;
  int? weight;


  int? shipperID;
  int? consigneeID;
  int? providedBy;
  int? carrierID;
  int? clientID;

  int? portID;
  int? exportPortID;
  int? exportLocation;


  AirwaybillRequest(
      {
        this.id,
      required this.type,

       this.airwaybillNumber,


       this.consigneeID,
    required   this.providedBy,
         this.carrierID,
       this.shipperID,
        this.clientID,
        this.weight,this.consignee,
        this.exportPortID,
        this.portID,
        this.exportLocation,
      });

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {
        'type': type,
        'airwaybillNumber':airwaybillNumber,
        'carrierID': carrierID,
        'clientUserID': clientID,
        'portID':portID,
        'weight':weight,
        'exportPortID':exportPortID,
        'exportLocation':exportLocation,
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
        'weight':weight,
        'consignee':consignee,

        'portID':portID,
        'exportPortID':exportPortID,
        'exportLocation':exportLocation,
      };
    }
  }
}
