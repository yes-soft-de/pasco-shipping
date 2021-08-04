class AcceptedShipmentFilterRequest{
  String? trackNumber;
  String transportationType;
  String? status;


  AcceptedShipmentFilterRequest({required  this.transportationType, this.trackNumber , this.status});

  Map<String, dynamic> toJson() => {
    'trackNumber':trackNumber ??'',
    'status':status ??'',
    'transportationType':transportationType,
  };
}