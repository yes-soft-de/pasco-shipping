class ProxyRequest {
  int? id;
  String fullName;
  String phone;
  String address;
  String email;

  ProxyRequest(
      {this.id,
      required this.fullName,
      required this.phone,
      required this.address,
      required this.email
      });

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {'fullName': fullName, 'phone': phone, 'address': address ,'email':email};
    } else {
      return {
        'id': id,
        'fullName': fullName,
        'phone': phone,
        'address': address,
        'email':email
      };
    }
  }
}
