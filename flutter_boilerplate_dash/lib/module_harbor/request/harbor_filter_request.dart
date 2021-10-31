class HarborFilterRequest {
  String? name;
  int? countryID;
  String? location;
  String? city;
  String? type;
  String? countryType;

  HarborFilterRequest(
      {
         this.name,
         this.city,
         this.countryID,
        this.location,
        this.type,
        this.countryType
      });

  Map<String, dynamic> toJson() {
      return {
        'name': name,
        'countryID': countryID,
        'city': city,
        'location':location,
        'type':type,
        'countryType':countryType,
      };
    }
  }