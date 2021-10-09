
class PriceResponse {
  PriceResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
 PriceModel? data;

  factory PriceResponse.fromJson(Map<String, dynamic> json) => PriceResponse(
    statusCode: json['status_code'],
    msg: json['msg'],
    data: PriceModel.fromJson(json['Data']),
  );
}

class PriceModel {
  PriceModel({
   required this.id,
    this.oneKiloPrice,
    this.oneCBMPrice,
    this.updatedAt,
   required this.containerPrice
  });

  int id;
  String? oneKiloPrice;
  String? oneCBMPrice;
  DateTime? updatedAt;
  List<ContainerPrice> containerPrice;

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
    id: json['id'],
    oneCBMPrice: json['oneCBMPrice'].toString(),
    oneKiloPrice: json['oneKiloPrice'].toString(),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    containerPrice: List<ContainerPrice>.from(json['containerSpecifications'].map((x) => ContainerPrice.fromJson(x)))

  );
}
class CreatedAt {
  CreatedAt({
    this.timestamp,
  });
  int? timestamp;
  factory CreatedAt.fromJson(Map<String, dynamic> json) => CreatedAt(

    timestamp: json["timestamp"],
  );
}
class ContainerPrice {
  ContainerPrice({
    required this.id,
    this.name,
    this.price,
  });

  int id;
  String? name;
  String? price;

  factory ContainerPrice.fromJson(Map<String, dynamic> json) => ContainerPrice(
    id: json['id'],
    name: json['name'].toString(),
    price: json['price'].toString(),
  );
}