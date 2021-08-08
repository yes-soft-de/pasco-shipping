class CountryRequest{
  int? id;
  String countryName;
  String type;
  String code;

  CountryRequest({this.id , required this.countryName,required this.type,required this.code});

  Map<String, dynamic> toJson() {
    if(id == null) {
      return {
        'name': countryName,
        'callingCode':code,
        'type':type
      };
    }else {
      return {
      'id':id,
      'name': countryName,
      'callingCode':code,
      'type':type
    };
    }
  }
}