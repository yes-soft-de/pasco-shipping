class TravelAddFinanceRequest {
  int? travelID;
  String stageDescription;
  int stageCost;
  String travelStatus;
  String currency;

  TravelAddFinanceRequest(
      {required this.travelID,
        required this.stageDescription,
        required this.stageCost,
        required this.travelStatus,
        required this.currency});
  Map<String, dynamic> toJson() {
    if (travelID == null) {
      return {
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'status': travelStatus,
        'currency': currency
      };
    } else {
      return {
        'travelID': travelID,
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'status': travelStatus,
        'currency': currency
      };
    }
  }
}