class AirwaybillSpecificationRequest {
  int? id;
  String? name;

  String? width;


  AirwaybillSpecificationRequest(
      {this.id,
      required this.name,
      required this.width,});

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {
        'name': name,
        'weight': width,
      };
    } else {
      return {
        'id': id,
        'name': name,
        'weight': width,
      };
    }
  }
}
