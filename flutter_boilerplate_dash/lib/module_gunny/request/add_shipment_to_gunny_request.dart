class AddShipmentToGunnyRequest {
  int gunnyID;
  int shipmentID;
  String trackNumber;
  int quantity;
  String gunnyStatus;
  AddShipmentToGunnyRequest({required this.gunnyID ,required this.shipmentID ,required this.trackNumber ,required this.quantity ,required this.gunnyStatus });
  Map<String, dynamic> toJson() {
    return {
      'gunnyID': gunnyID,
      'shipmentID':shipmentID,
      'trackNumber':trackNumber,
      'quantity':quantity,
      'gunnyStatus':gunnyStatus
    };
  }
}
