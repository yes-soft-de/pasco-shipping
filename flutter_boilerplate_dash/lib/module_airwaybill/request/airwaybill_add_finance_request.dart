
class AirwaybillAddFinanceRequest {
  int? airwaybillID;
  String stageDescription;
  int stageCost;
  String status;
  String currency;

  int? subcontractID;
  // int? proxyID;
  // int? clientUserID;
  // String paymentType;
  // String? chequeNumber;
  // String? financialFundName;

  int? sellingCost;
  int? buyingCost ;

  AirwaybillAddFinanceRequest(
      {required this.airwaybillID,
        required this.stageDescription,
        required this.stageCost,
        required this.status,
        required this.currency,
        // required this.paymentType,
        // this.financialFundName,
        // this.chequeNumber,
        this.subcontractID,
        this.buyingCost,
        this.sellingCost,
        // this.proxyID
        // this.clientUserID

      });
  Map<String, dynamic> toJson() {
    if (airwaybillID == null) {
      return {
        // 'proxyID':proxyID,
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'status': status,
        'currency': currency,
        'subcontractID':subcontractID,
        // 'chequeNumber':chequeNumber,
        // 'financialFundName':financialFundName,
        // 'paymentType':paymentType,
        "sellingCost":sellingCost,
        "buyingCost":buyingCost
        // 'clientUserID':clientUserID
      };
    } else {
      return {
        'airwaybillID': airwaybillID,
        // 'proxyID': proxyID,
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'status': status,
        'currency': currency,
        'subcontractID':subcontractID,
        // 'chequeNumber':chequeNumber,
        // 'financialFundName':financialFundName,
        // 'paymentType':paymentType,
        "sellingCost":sellingCost,
        "buyingCost":buyingCost
        // 'clientUserID':clientUserID
      };
    }
  }
}