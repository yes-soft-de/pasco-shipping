class TravelChangeStateRequest {
  int id;
  String status;

  TravelChangeStateRequest(
      {
        required this.id,
        required this.status,
      });

  Map<String, dynamic> toJson() {
      return {
        'id': id,
        'status': status
      };
    }
}