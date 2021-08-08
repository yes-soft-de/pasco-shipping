class ContainerSpecificationRequest {
  int? id;
  String? name;

  String? capacityCPM;
  String? widthInMeter;
  String? hightInMeter;
  String? lengthInMeter;

  ContainerSpecificationRequest(
      {this.id,
      required this.name,
      required this.capacityCPM,
      required this.widthInMeter,
      required this.lengthInMeter,
      required this.hightInMeter});

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {
        'name': name,
        'capacityCPM': capacityCPM,
        'widthInMeter': widthInMeter,
        'hightInMeter': hightInMeter,
        'lengthInMeter': lengthInMeter
      };
    } else {
      return {
        'id': id,
        'capacityCPM': capacityCPM,
        'widthInMeter': widthInMeter,
        'hightInMeter': hightInMeter,
        'lengthInMeter': lengthInMeter
      };
    }
  }
}
