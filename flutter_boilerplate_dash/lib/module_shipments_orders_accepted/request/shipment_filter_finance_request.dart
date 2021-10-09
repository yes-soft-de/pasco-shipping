class ShipmentLCLFilterFinanceRequest {
  int shipmentID;
  String trackNumber;

  ShipmentLCLFilterFinanceRequest(
      {required this.shipmentID,
        required this.trackNumber,
        });
  Map<String, dynamic> toJson() {
      return {
        'shipmentID': shipmentID,
        'trackNumber': trackNumber,
      };
  }
}
