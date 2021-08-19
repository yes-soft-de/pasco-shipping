class AirwaybillFilterFinanceRequest {
  int id;
  String? status;

  AirwaybillFilterFinanceRequest(
      {
        required this.id,
        this.status,
      });

  Map<String, dynamic> toJson() {
    return {
      'airwaybillID': id,
      'status': status
    };
  }
}