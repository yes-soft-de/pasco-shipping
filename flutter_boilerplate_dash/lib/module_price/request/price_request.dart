class PriceRequest{
  int id;
  int containerSpecificationID;
  int containerSpecificationPrice;
  String oneKiloPrice;
  String oneCBMPrice;

  PriceRequest({required this.containerSpecificationPrice , required this.containerSpecificationID, required this.oneCBMPrice,required this.oneKiloPrice ,required this.id});

  Map<String, dynamic> toJson() => {
    'oneKiloPrice': oneKiloPrice,
    'oneCBMPrice': oneCBMPrice,
    'id':id,
    'containerSpecificationID':containerSpecificationID,
    'containerSpecificationPrice':containerSpecificationPrice
};
}