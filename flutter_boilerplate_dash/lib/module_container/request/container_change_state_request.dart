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