class ReceivedRequest{
  int shipmentId;
  String trackNumber;

  String notes;
  int supplierID;


  int receivedQuantity;


  ReceivedRequest({required  this.shipmentId,required this.trackNumber ,required this.notes , required this.receivedQuantity ,required this.supplierID});

  Map<String, dynamic> toJson() => {
    'shipmentID': shipmentId,
    'trackNumber':trackNumber,
    'notes':notes,
    'supplierID':supplierID,
    'receivedQuantity':receivedQuantity,
  };
}