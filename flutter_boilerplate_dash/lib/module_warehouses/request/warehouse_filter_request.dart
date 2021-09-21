class WarehouseFilterRequest {
  String? typeOfCountry;
  String? cityName;
  WarehouseFilterRequest(
      {
         this.typeOfCountry,
         this.cityName,
      });
  Map<String, dynamic> toJson() {
    return {
      'typeOfCountry': typeOfCountry,
      'target': cityName,
    };
  }
}