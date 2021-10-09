class ContainerChangeStateRequest {
  int id;
  String status;

  ContainerChangeStateRequest(
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


class ContainerClearedOrArrivedRequest {
  int id;
  String status;

  ContainerClearedOrArrivedRequest(
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