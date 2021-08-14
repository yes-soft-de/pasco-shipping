class ShipmentFinanceRequest {
  int shipmentID;
  String trackNumber;
  String stageDescription;
  int stageCost;
  String shipmentStatus;
  String currency;

  ShipmentFinanceRequest(
      {required this.shipmentID,
      required this.trackNumber,
      required this.stageDescription,
      required this.stageCost,
      required this.shipmentStatus,
      required this.currency});
  Map<String, dynamic> toJson() {
    if (shipmentID == null) {
      return {
        'trackNumber': trackNumber,
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'shipmentStatus': shipmentStatus,
        'currency': currency
      };
    } else {
      return {
        'id': shipmentID,
        'trackNumber': trackNumber,
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'shipmentStatus': shipmentStatus,
        'currency': currency
      };
    }
  }
}
