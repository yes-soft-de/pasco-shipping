class ReceiverRequest {
  int? id;
  String fullName;
  String phone;
  String? email;
  String? address;
  ReceiverRequest({
    this.id,
   required this.fullName,
     this.address,
    required this.phone,
     this.email
  });
  Map<String, dynamic> toJson() {
    if(id != null){
      return {
        'id':id,
        'fullName': fullName,
        'email': email,
        'address': address,
        'phone': phone,
      };
    }
   else {
      return {
      'fullName': fullName,
      'email': email,
      'address': address,
      'phone': phone,
    };
    }
  }
}
