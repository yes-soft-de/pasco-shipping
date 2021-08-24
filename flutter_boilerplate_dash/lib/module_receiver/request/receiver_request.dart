class ReceiverRequest {
  int clientUserID;
  String fullName;
  String address;
  String email;
  String phone;
  ReceiverRequest({required this.clientUserID ,required this.email ,required this.address,required this.phone,required this.fullName});
  Map<String, dynamic> toJson() {
    return {
      'clientUserID':clientUserID,
      'fullName':fullName,
      'address':address,
      'email':email,
      'phone':phone
    };
  }
}
