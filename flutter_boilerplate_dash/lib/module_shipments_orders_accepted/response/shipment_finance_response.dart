import 'package:pasco_shipping/utils/logger/logger.dart';

class ShipmentFinanceResponse {
  ShipmentFinanceResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<ShipmentFinanceModel>? data;

  ShipmentFinanceResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <ShipmentFinanceModel>[];
      try {
        data = List<ShipmentFinanceModel>.from(json['Data'].map((x) => ShipmentFinanceModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class ShipmentFinanceModel {
  ShipmentFinanceModel({
    this.shipmentID,
    this.trackNumber,
    this.shipmentStatus,
    this.stageDescription,
    this.stageCost,


    // this.createdAt,
    // this.updatedAt,
    // this.updatedByUser,
    // this.createdByUser
  });

  int? shipmentID;
  String? trackNumber;
  String? shipmentStatus;
  int? stageCost;
  String? stageDescription;
  String? currency;

  // DateTime? createdAt;
  // DateTime? updatedAt;
  // String? updatedByUser;
  // String? createdByUser;


  factory ShipmentFinanceModel.fromJson(Map<String, dynamic> json) => ShipmentFinanceModel(
    shipmentID: json['shipmentID'],
    trackNumber: json['trackNumber'],
    shipmentStatus: json['shipmentStatus']?? '',
      stageCost: json['stageCost']?? '',
    stageDescription: json['stageDescription']?? '',

    // createdAt: DateTime.fromMillisecondsSinceEpoch(
    //     CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    // updatedAt: DateTime.fromMillisecondsSinceEpoch(
    //     CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    // updatedByUser: json['updatedByUser'],
    // createdByUser: json['createdByUser'],

  );
}

class CreatedAt {
  CreatedAt({
    this.timestamp,
  });
  int? timestamp;
  factory CreatedAt.fromJson(Map<String, dynamic> json) => CreatedAt(
    timestamp: json['timestamp'],
  );
}
