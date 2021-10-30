class SubcontractRequest {
  int? id;
  String fullName;
  String phone;
  int serviceID;

  SubcontractRequest(
      {this.id,
      required this.fullName,
      required this.phone,
      required this.serviceID});

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {'fullName': fullName, 'phone': phone, 'serviceID': serviceID};
    } else {
      return {
        'id': id,
        'fullName': fullName,
        'phone': phone,
        'serviceID': serviceID
      };
    }
  }
}
