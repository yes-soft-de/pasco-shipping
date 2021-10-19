
import 'package:pasco_shipping/utils/logger/logger.dart';

class PriceResponse {
  PriceResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
 PriceModel? data;

 PriceResponse.fromJson(Map<String, dynamic> json) {
    statusCode =  json['status_code'];
    msg= json['msg'];
    try {
      data= PriceModel.fromJson(json['Data']);
    } catch (e, stack) {
      Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
          StackTrace.current);
    }
}}

class PriceModel {
  PriceModel({
   required this.containerPrice,
   required this.linesPrice
  });


  List<ContainerPrice> containerPrice=[];
  List<LinesPrice> linesPrice=[];

   PriceModel.fromJson(Map<String, dynamic> json) {
     try{
       containerPrice =[];
       linesPrice=[];
       containerPrice= List<ContainerPrice>.from(json['containerSpecifications'].map((x) => ContainerPrice.fromJson(x)));
       linesPrice= List<LinesPrice>.from(json['prices'].map((x) => LinesPrice.fromJson(x)));
     } catch (e, stack) {
       Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
           StackTrace.current);
     }

  }
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

class LinesPrice {
  LinesPrice({
    required this.id,
    this.exportCity,
    this.exportCountryID,
    this.oneCBMPrice,
    this.oneKiloPrice,
    this.exportCountryName,
    this.importCity,
    this.importCountryID,
    this.importCountryName,
  });

  int id;
  int? exportCountryID;
  int? importCountryID;
  String? oneKiloPrice;
  String? oneCBMPrice;
  String? exportCity;
  String? exportCountryName;
  String? importCountryName;
  String? importCity;

  factory LinesPrice.fromJson(Map<String, dynamic> json) => LinesPrice(
    id: json['id'],
    exportCountryID: json['exportCountryID'],
    importCountryID: json['importCountryID'],
    oneKiloPrice: json['oneKiloPrice'].toString(),
    oneCBMPrice: json['oneCBMPrice'].toString(),
    exportCity: json['exportCity'],
    exportCountryName: json['exportCountryName'],
    importCountryName: json['importCountryName'],
    importCity: json['importCity'],
  );
}