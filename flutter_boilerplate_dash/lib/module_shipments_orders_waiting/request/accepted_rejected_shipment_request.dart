class AcceptedOrRejectedRequest{
  int shipmentId;
  String status;

  AcceptedOrRejectedRequest({required  this.shipmentId,required this.status});

  Map<String, dynamic> toJson() => {
    'id': shipmentId,
    'status':status
  };
}