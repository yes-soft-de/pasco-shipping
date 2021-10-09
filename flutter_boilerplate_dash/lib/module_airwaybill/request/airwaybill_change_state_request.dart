class AirwaybillChangeStateRequest {
  int id;
  String status;

  AirwaybillChangeStateRequest(
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

class AirwaybillClearedOrArrivedRequest {
  int id;
  String status;

  AirwaybillClearedOrArrivedRequest(
      {
        required this.id,
        required this.status,
      });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'shippingStatus': status
    };
  }
}