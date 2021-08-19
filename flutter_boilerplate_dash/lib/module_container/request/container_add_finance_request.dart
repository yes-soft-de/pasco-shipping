class ContainerAddFinanceRequest {
  int? containerID;
  String stageDescription;
  int stageCost;
  String travelStatus;
  String currency;

  ContainerAddFinanceRequest(
      {required this.containerID,
        required this.stageDescription,
        required this.stageCost,
        required this.travelStatus,
        required this.currency});
  Map<String, dynamic> toJson() {
    if (containerID == null) {
      return {
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'status': travelStatus,
        'currency': currency
      };
    } else {
      return {
        'containerID': containerID,
        'stageDescription': stageDescription,
        'stageCost': stageCost,
        'status': travelStatus,
        'currency': currency
      };
    }
  }
}