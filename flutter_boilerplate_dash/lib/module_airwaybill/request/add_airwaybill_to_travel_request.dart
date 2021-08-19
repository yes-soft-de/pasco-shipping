class AddAirwaybillToTravelRequest{
  int holderID;
  // int travelID;
  String shipmentStatus;

  AddAirwaybillToTravelRequest({
    required this.holderID,required this.shipmentStatus});

  Map<String, dynamic> toJson() {
    return {
      'holderType': 'airwaybill',
      'holderID': holderID,
      // 'travelID':travelID,
      'shipmentStatus':shipmentStatus
    };
  }
}