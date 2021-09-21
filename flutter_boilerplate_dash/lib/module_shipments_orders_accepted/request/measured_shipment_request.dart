class MeasuredRequest{
  int shipmentId;
  String trackNumber;
  String shipmentStatus;
  String statusDetails;


  // int importWarehouseID;
  String packetingBy;
  double weight;
  double volume;
  String qrCode;
  int guniQuantity;

  MeasuredRequest({required this.volume ,required this.packetingBy ,required this.guniQuantity   ,required  this.shipmentId,required this.trackNumber ,required this.shipmentStatus , required this.weight ,required this.statusDetails , required this.qrCode});

  Map<String, dynamic> toJson() => {
    'id': shipmentId,
    'trackNumber':trackNumber,
    'shipmentStatus':shipmentStatus,
    'statusDetails':statusDetails,

    'volume':volume,
    'weight':weight,
    'guniQuantity':guniQuantity,
    'qrCode':qrCode,
    'packetingBy':packetingBy,
    // 'importWarehouseID':importWarehouseID,
  };
}