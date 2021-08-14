class WarehouseRequest {
  int? id;
  String name;
  int? subContractID;
  int countryID;
  String city;
  String location;
  String type;
  double? rentingFee;
  int? proxyID;

  WarehouseRequest(
      {this.id,
      required this.name,
        this.subContractID,
        this.proxyID,
       required this.type,
        this.rentingFee,
       required this.countryID,
       required this.city,
       required this.location
      });

  Map<String, dynamic> toJson() {
    if (id == null) {
      return {
        'name': name,
        'subcontractID': subContractID ,
        'proxyID':proxyID ,
        'type':type,
        'rentingFee':rentingFee,
        'countryID':countryID,
        'city':city,
        'location':location

      };
    } else {
      return {
        'id': id,
        'name': name,
        'subcontractID': subContractID ,
        'proxyID':proxyID ,
        'type':type,
        'rentingFee':rentingFee,
        'countryID':countryID,
        'city':city,
        'location':location
      };
    }
  }
}
