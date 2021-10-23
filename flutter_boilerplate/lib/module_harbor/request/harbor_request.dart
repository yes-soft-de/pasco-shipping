class HarborRequest {
  int? id;
  String? name;
  int? countryID;
  String? location;
  String? city;
  String? type;

  HarborRequest(
      {this.id,
       this.name,
       this.city,
       this.countryID,
        this.location,
        this.type
      });

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {
        'name': name,
        'countryID': countryID,
        'city': city,
        'location':location,
        'type':type
      };
    } else {
      return {
        'id': id,
        'name': name,
        'countryID': countryID,
        'city': city,
        'location':location,
        'type':type
      };
    }
  }
}
