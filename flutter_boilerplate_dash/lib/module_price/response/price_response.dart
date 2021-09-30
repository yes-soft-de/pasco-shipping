
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
    this.updatedAt
  });

  int id;
  String? oneKiloPrice;
  String? oneCBMPrice;
  DateTime? updatedAt;

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
    id: json['id'],
    oneCBMPrice: json['oneCBMPrice'].toString(),
    oneKiloPrice: json['oneKiloPrice'].toString(),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
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