class ContainerPriceRequest{
  int containerSpecificationID;
  int exportCountryID;
  int destinationPortID;
  String exportCity;
  int price ;
  int? id;

  ContainerPriceRequest({this.id, required this.price , required this.containerSpecificationID , required this.exportCity ,required this.exportCountryID ,required this.destinationPortID});

  Map<String, dynamic> toJson() => {
    'containerSpecificationID':containerSpecificationID,
    'exportCountryID':exportCountryID,
    'destinationPortID':destinationPortID,
    'exportCity':exportCity,
    'price':price,
    'id':id
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