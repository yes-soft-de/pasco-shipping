class TravelFilterRequest {

  String type;
  String? launchCountry;
  String? destinationCountry;

  String status;

  String? launchDate;
  String? arrivalDate;

  String? travelNumber;

  TravelFilterRequest(
      {
        required this.type,
         this.launchCountry,
         this.destinationCountry,
         this.arrivalDate,
         this.launchDate,
       required  this.status,
        this.travelNumber
      });

  Map<String, dynamic> toJson() {
    return {
     'type': type,
     'launchCountry': launchCountry ?? '',
     'destinationCountry': destinationCountry ?? '',
     'launchDate': launchDate ?? '',
     'arrivalDate': arrivalDate ?? '',
     'status': status.isEmpty ? null :status,
      'travelNumber':travelNumber ??''
   };
  }
}