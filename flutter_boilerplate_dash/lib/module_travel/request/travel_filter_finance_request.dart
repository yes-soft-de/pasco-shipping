class TravelFilterFinanceRequest {
  int id;
  String? status;

  TravelFilterFinanceRequest(
      {
        required this.id,
        this.status,
      });

  Map<String, dynamic> toJson() {
    return {
      'travelID': id,
      'status': status
    };
  }
}