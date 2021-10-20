class ShipmentLCLFinanceRequest {
  int shipmentID;
  String trackNumber;
  String stageDescription;
  int stageCost;
  String shipmentStatus;
  String currency;

  int? subcontractID;
  int? proxyID;
  String paymentType;
  String? chequeNumber;
  // String? financialFundName;


  ShipmentLCLFinanceRequest(
      {required this.shipmentID,
      required this.trackNumber,
      required this.stageDescription,
      required this.stageCost,
      required this.shipmentStatus,
      required this.currency,
        this.subcontractID,
        this.chequeNumber ,
        // this.financialFundName,
       required this.paymentType,
        this.proxyID

      });
  Map<String, dynamic> toJson() {
    if (shipmentID == null) {
      return {
        'trackNumber': trackNumber,
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'shipmentStatus': shipmentStatus,
        'currency': 'US Dollar',
        'subcontractID':subcontractID,
        'chequeNumber':chequeNumber,
        // 'financialFundName':financialFundName,
        'paymentType':paymentType,
        'proxyID':proxyID
      };
    } else {
      return {
        'shipmentID': shipmentID,
        'trackNumber': trackNumber,
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'shipmentStatus': shipmentStatus,
        'currency': 'US Dollar',
        'subcontractID':subcontractID,
        'chequeNumber':chequeNumber,
        'proxyID':proxyID,
        'paymentType':paymentType,
      };
    }
  }
}
