class FilterGunnyRequest {
  String status;
  String? identificationNumber;

  FilterGunnyRequest({required this.status , this.identificationNumber});
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'identificationNumber':identificationNumber,
    };
  }
}