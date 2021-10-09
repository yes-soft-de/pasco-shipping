class ContainerSpecificationRequest {
  int? id;
  String? name;

  String? capacityCPM;
  String? widthInMeter;
  String? hightInMeter;
  String? lengthInMeter;
  String? price;

  ContainerSpecificationRequest(
      {this.id,
      required this.name,
      required this.capacityCPM,
      required this.widthInMeter,
      required this.lengthInMeter,
      required this.hightInMeter,this.price
      });

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {
        'name': name,
        'capacityCPM': capacityCPM,
        'widthInMeter': widthInMeter,
        'hightInMeter': hightInMeter,
        'lengthInMeter': lengthInMeter,
        'price': price
      };
    } else {
      return {
        'id': id,
        'name': name,
        'capacityCPM': capacityCPM,
        'widthInMeter': widthInMeter,
        'hightInMeter': hightInMeter,
        'lengthInMeter': lengthInMeter,
        'price': price,
      };
    }
  }
}
