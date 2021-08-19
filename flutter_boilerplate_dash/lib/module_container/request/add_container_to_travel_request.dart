class AddContainerToTravelRequest{
  int holderID;
  // int travelID;
  String shipmentStatus;

  AddContainerToTravelRequest({
   required this.holderID,required this.shipmentStatus});

  Map<String, dynamic> toJson() {
    return {
      'holderType': 'container',
      'holderID': holderID,
      // 'travelID':travelID,
      'shipmentStatus':shipmentStatus
    };
  }
}