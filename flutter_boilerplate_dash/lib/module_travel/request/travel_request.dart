class TravelRequest {
  int? id;

  String type;
  String launchCountry;
  String destinationCountry;

  String? travelNumber;
  String status;

  String? launchDate;
  String? arrivalDate;

  int? shipperID;
  int? carrierID;

  TravelRequest(
      {this.id,
      required this.type,
      required this.launchCountry,
      required this.destinationCountry,
       this.travelNumber,
       this.arrivalDate,
       this.launchDate,
      required this.status,
         this.carrierID,
       this.shipperID});

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {
        'type': type,
        'launchCountry': launchCountry,
        'destinationCountry': destinationCountry,
        'launchDate': launchDate,
        'arrivalDate': arrivalDate,
        'travelNumber': travelNumber,
        'shipperID': shipperID,
        'carrierID': carrierID,
        'status': status
      };
    } else {
      return {
        'id': id,
        'type': type,
        'launchCountry': launchCountry,
        'destinationCountry': destinationCountry,
        'launchDate': launchDate,
        'arrivalDate': arrivalDate,
        'travelNumber': travelNumber,
        'shipperID': shipperID,
        'carrierID': carrierID,
        'status': status
      };
    }
  }
}
