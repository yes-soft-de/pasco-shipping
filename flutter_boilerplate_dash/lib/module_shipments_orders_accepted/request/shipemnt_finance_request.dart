class ShipmentLCLFinanceRequest {
  int shipmentID;
  String trackNumber;
  String stageDescription;
  int stageCost;
  String shipmentStatus;
  String currency;

  int? subcontractID;
  String paymentType;
  String? chequeNumber;
  String? financialFundName;


  ShipmentLCLFinanceRequest(
      {required this.shipmentID,
      required this.trackNumber,
      required this.stageDescription,
      required this.stageCost,
      required this.shipmentStatus,
      required this.currency,
        this.subcontractID,
        this.chequeNumber ,
        this.financialFundName,
       required this.paymentType

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
        'financialFundName':financialFundName,
        'paymentType':paymentType,
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
        'financialFundName':financialFundName,
        'paymentType':paymentType,
      };
    }
  }
}
