class ContainerPriceRequest{
  int containerSpecificationID;
  int containerSpecificationPrice;

  ContainerPriceRequest({required this.containerSpecificationPrice , required this.containerSpecificationID});

  Map<String, dynamic> toJson() => {
    'id':containerSpecificationID,
    'price':containerSpecificationPrice
};
}
class ShippingLinePriceRequest{
  int? id;
  double oneKiloPrice;
  double oneCBMPrice;
  int exportCountryID;
  int importCountryID;
  String exportCity;
  String importCity;

  ShippingLinePriceRequest({required this.oneCBMPrice , required this.oneKiloPrice ,required this.importCity ,required this.exportCity ,required this.importCountryID, required this.exportCountryID ,this.id});

  Map<String, dynamic> toJson() => {
    'id':id,
    'oneKiloPrice':oneKiloPrice,
    'oneCBMPrice':oneCBMPrice,
    'exportCountryID':exportCountryID,
    'importCountryID':importCountryID,
    'exportCity':exportCity,
    'importCity':importCity,
};
}