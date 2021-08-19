class StoredRequest{
  int shipmentId;
  String trackNumber;
  String shipmentStatus;
  String statusDetails;

  int travelID;


  bool packed;
  bool isInOneHolder;

  int holderID;
  String holderType;

  int amount;


  StoredRequest({ required this.travelID, required this.amount ,required this.packed ,required this.holderID ,required this.holderType   ,required  this.shipmentId,required this.trackNumber ,required this.shipmentStatus , required this.isInOneHolder ,required this.statusDetails });

  Map<String, dynamic> toJson() => {
    'shipmentID': shipmentId,
    'trackNumber':trackNumber,
    'shipmentStatus':shipmentStatus,
    'statusDetails':statusDetails,

    'packed':packed,
    'isInOneHolder':isInOneHolder,
    'holderID':holderID,
    'holderType':holderType,
    'amount':amount,

    'travelID':travelID,
  };
}