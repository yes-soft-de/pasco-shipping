class ContainerFilterFinanceRequest {
  int id;
  String? status;

  ContainerFilterFinanceRequest(
      {
        required this.id,
        this.status,
      });

  Map<String, dynamic> toJson() {
    return {
      'containerID': id,
      'status': status
    };
  }
}