class PriceRequest{
  int id;
  String oneKiloPrice;
  String oneCBMPrice;

  PriceRequest({required this.oneCBMPrice,required this.oneKiloPrice ,required this.id});

  Map<String, dynamic> toJson() => {
    'oneKiloPrice': oneKiloPrice,
    'oneCBMPrice': oneCBMPrice,
    'id':id
};
}