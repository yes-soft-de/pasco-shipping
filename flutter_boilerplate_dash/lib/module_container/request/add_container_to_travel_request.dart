class AddContainerToTravelRequest{
  String holderType;
  int holderID;
  int travelID;
  String shipmentStatus;

  AddContainerToTravelRequest({
    required  this.holderType,required this.holderID,required this.travelID,required this.shipmentStatus});

  Map<String, dynamic> toJson() {
    return {
      'holderType': holderType,
      'holderID': holderID,
      'travelID':travelID,
      'shipmentStatus':shipmentStatus
    };
  }
}