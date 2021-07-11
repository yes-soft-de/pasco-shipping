import 'package:pasco_shipping/utils/logger/logger.dart';

class WarehouseResponse {
  WarehouseResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<Countries>? data;

  WarehouseResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <Countries>[];
      try {
        data = List<Countries>.from(
            json['Data'].map((x) => Countries.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }
}

class Countries {
  Countries({this.id, this.name, this.warehouses});

  int? id;
  String? name;
  String? type;
  List<Warehouse>? warehouses;

  Countries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type= json['type'];
    if (json['warehouses'] != null) {
      warehouses = <Warehouse>[];
      try {
        warehouses = List<Warehouse>.from(
            json['warehouses'].map((x) => Warehouse.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }
}

class Warehouse {
  Warehouse({
    this.id,
    this.name,
    this.countryName,
    this.city,
  });

  int? id;
  String? name;
  String? countryName;
  String? city;

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
        id: json["id"],
        name: json["name"],
        countryName: json["countryName"],
        city: json["city"],
      );

}
