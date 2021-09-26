class TravelChangeStateRequest {
  int id;
  String status;
  String? launchDate;
  String? arrivalDate;

  TravelChangeStateRequest(
      {
        required this.id,
        required this.status,
        this.launchDate,
        this.arrivalDate
      });

  Map<String, dynamic> toJson() {
      return {
        'id': id,
        'status': status,
        'launchDate':launchDate,
        'arrivalDate':arrivalDate
      };
    }
}