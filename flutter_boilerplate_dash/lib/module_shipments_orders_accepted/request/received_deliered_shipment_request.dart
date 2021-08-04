class ReceivedOrDeliveredRequest{
  int shipmentId;
  String trackNumber;
  String shipmentStatus;

  String statusDetails;
  bool isInOneHolder;
  bool packed;

  ReceivedOrDeliveredRequest({required  this.shipmentId,required this.trackNumber ,required this.shipmentStatus , required this.isInOneHolder ,required this.statusDetails , required this.packed});

  Map<String, dynamic> toJson() => {
    'shipmentID': shipmentId,
    'trackNumber':trackNumber,
    'shipmentStatus':shipmentStatus,
    'statusDetails':statusDetails,
    'isInOneHolder':isInOneHolder,
    'packed':packed
  };
}