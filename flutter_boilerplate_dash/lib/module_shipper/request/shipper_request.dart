class ShipperRequest {
  int? id;
  String fullName;
  String phone;
  String address;
  String email;

  ShipperRequest(
      {this.id,
      required this.fullName,
      required this.phone,
      required this.address,
        required this.email
      });

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {'name': fullName, 'phone': phone, 'address': address , 'email':email};
    } else {
      return {
        'id': id,
        'name': fullName,
        'phone': phone,
        'address': address,
        'email':email
      };
    }
  }
}
