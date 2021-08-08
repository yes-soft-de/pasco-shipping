class SupplierRequest {
  int? id;
  String fullName;
  String phone;
  String address;

  SupplierRequest(
      {this.id,
      required this.fullName,
      required this.phone,
      required this.address});

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {'fullName': fullName, 'phone': phone, 'address': address};
    } else {
      return {
        'id': id,
        'fullName': fullName,
        'phone': phone,
        'address': address
      };
    }
  }
}
