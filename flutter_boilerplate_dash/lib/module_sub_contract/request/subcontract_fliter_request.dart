class FilterSubcontractRequest {
  String? fullName;
  String? serviceName;
  int? serviceID;

  FilterSubcontractRequest(
      {
         this.fullName,
         this.serviceName,
         this.serviceID
      });

  Map<String, dynamic> toJson() {
      return {
        'fullName': fullName,
        'serviceName': serviceName,
        'serviceID': serviceID
      };
    }
}
