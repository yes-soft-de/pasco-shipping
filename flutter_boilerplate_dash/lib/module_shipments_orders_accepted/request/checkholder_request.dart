class CheckHolderRequest{
  int shipmentId;
  String trackNumber;

  bool packed;
  bool isInOneHolder;

  int holderID;
  String holderType;

  int amount;


  CheckHolderRequest({
    required this.amount
    ,required this.packed ,
    required this.holderID ,
    required this.holderType
    ,required  this.shipmentId,
    required this.trackNumber ,
    required this.isInOneHolder});

  Map<String, dynamic> toJson() => {
    'shipmentID': shipmentId,
    'trackNumber':trackNumber,


    'packed':packed,
    'isInOneHolder':isInOneHolder,
    'holderID':holderID,
    'holderType':holderType,
    'amount':amount,

  };
}