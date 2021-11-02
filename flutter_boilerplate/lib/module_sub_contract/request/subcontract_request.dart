class SubcontractRequest {
  int? id;
  String? fullName;
  String? phone;
  String serviceName;
  int? serviceID;

  SubcontractRequest(
      {this.id,
       this.fullName,
       this.phone,
       required this.serviceName,
       this.serviceID});

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {
        'serviceName': serviceName,
        'fullName': fullName, 'phone': phone, 'serviceID': serviceID};
    } else {
      return {
        'id': id,
        'fullName': fullName,
        'phone': phone,
        'serviceID': serviceID,
        'serviceName': serviceName
      };
    }
  }
}
