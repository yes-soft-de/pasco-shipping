
import 'package:pasco_shipping/utils/logger/logger.dart';

class WarehouseResponse {
  WarehouseResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<Warehouse>? data;

  WarehouseResponse.fromJson(Map<String, dynamic> json) {
     statusCode = json['status_code'];
     msg = json['msg'];
     if (json['Data'] != null) {
       data = <Warehouse>[];
       try {
         data =  List<Warehouse>.from(json['Data'].map((x) => Warehouse.fromJson(x)));
       } catch (e, stack) {
         Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
             StackTrace.current);
       }
     }
   }


  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "msg": msg,
    'Data': List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Warehouse{
  Warehouse({
    this.id,
    this.name,
    this.subcontractName,
    this.countryName,
    this.city,
    this.location,
    this.createdByUser,
    this.createdByUserImage,
    this.updatedByUser,
    this.updatedByUserImage,
    this.rentingFee,
    this.proxyName,
  });

  int? id;
  String? name;
  String? subcontractName;
  String? countryName;
  String? city;
  String? location;
  String? createdByUser;
  String? createdByUserImage;
  String? updatedByUser;
  String? updatedByUserImage;
  String? rentingFee;
  String? proxyName;

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
    id: json["id"],
    name: json["name"],
    subcontractName: json["subcontractName"],
    countryName: json["countryName"],
    city: json["city"],
    location: json["location"],
    createdByUser: json["createdByUser"],
    createdByUserImage: json["createdByUserImage"],
    updatedByUser: json["updatedByUser"],
    updatedByUserImage: json["updatedByUserImage"],
    rentingFee: json["rentingFee"],
    proxyName: json["proxyName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "subcontractName": subcontractName,
    "countryName": countryName,
    "city": city,
    "location": location,
    "createdByUser": createdByUser,
    "createdByUserImage": createdByUserImage,
    "updatedByUser": updatedByUser,
    "updatedByUserImage": updatedByUserImage,
    "rentingFee": rentingFee,
    "proxyName": proxyName,
  };
}
