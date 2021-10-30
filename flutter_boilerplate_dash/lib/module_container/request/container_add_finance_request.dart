class ContainerAddFinanceRequest {
  int? containerID;
  String stageDescription;
  int stageCost;
  String status;
  String currency;

  int? subcontractID;
  // int? clientUserID;
  // String paymentType;
  // String? chequeNumber;
  // String? financialFundName;

  int? sellingCost;
  int? buyingCost ;
  // int? proxyID ;

  ContainerAddFinanceRequest(
      {required this.containerID,
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
    if (containerID == null) {
      return {
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'status': status,
        'currency': currency,
        'subcontractID':subcontractID,
        // 'chequeNumber':chequeNumber,
        // 'financialFundName':financialFundName,
        // 'paymentType':paymentType,
        "sellingCost":sellingCost,
        "buyingCost":buyingCost,
        // 'proxyID':proxyID
      };
    } else {
      return {
        'containerID': containerID,
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'status': status,
        'currency': currency,
        'subcontractID':subcontractID,
        // 'chequeNumber':chequeNumber,
        // 'paymentType':paymentType,
        "sellingCost":sellingCost,
        "buyingCost":buyingCost,
        // 'proxyID':proxyID
        // 'clientUserID':clientUserID
      };
    }
  }
}