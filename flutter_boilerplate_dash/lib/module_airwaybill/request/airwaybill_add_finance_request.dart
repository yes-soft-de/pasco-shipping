class AirwaybillAddFinanceRequest {
  int? airwaybillID;
  String stageDescription;
  int stageCost;
  String travelStatus;
  String currency;

  AirwaybillAddFinanceRequest(
      {required this.airwaybillID,
        required this.stageDescription,
        required this.stageCost,
        required this.travelStatus,
        required this.currency});
  Map<String, dynamic> toJson() {
    if (airwaybillID == null) {
      return {
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'status': travelStatus,
        'currency': currency
      };
    } else {
      return {
        'airwaybillID': airwaybillID,
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'status': travelStatus,
        'currency': currency
      };
    }
  }
}