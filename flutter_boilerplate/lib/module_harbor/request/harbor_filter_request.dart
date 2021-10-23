class HarborFilterRequest {
  String? name;
  int? countryID;
  String? location;
  String? city;
  String? type;

  HarborFilterRequest(
      {
         this.name,
         this.city,
         this.countryID,
        this.location,
        this.type
      });

  Map<String, dynamic> toJson() {
      return {
        'name': name,
        'countryID': countryID,
        'city': city,
        'location':location,
        'type':type
      };
    }
  }