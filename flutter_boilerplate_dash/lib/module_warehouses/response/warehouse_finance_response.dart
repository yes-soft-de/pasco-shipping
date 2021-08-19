import 'package:pasco_shipping/utils/logger/logger.dart';

class WarehouseFinanceResponse {
  WarehouseFinanceResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<WarehouseFinanceModel>? data ;


  WarehouseFinanceResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <WarehouseFinanceModel>[];
      try {
        data = List<WarehouseFinanceModel>.from(json['Data'].map((x) => WarehouseFinanceModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}


class WarehouseFinanceModel {
  WarehouseFinanceModel({
    this.warehouseID,
    this.stageCost,
    this.stageDescription,
    this.currency,


    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser
  });

  int? warehouseID;
  int? stageCost;
  String? stageDescription;

  String? currency;


  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory WarehouseFinanceModel.fromJson(Map<String, dynamic> json) => WarehouseFinanceModel(
    warehouseID: json['warehouseID'],
    stageDescription: json['description'],

    stageCost: json['cost'],
    currency: json['currency'],



    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    updatedByUser: json['updatedByUser'],
    createdByUser: json['createdByUser'],

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
