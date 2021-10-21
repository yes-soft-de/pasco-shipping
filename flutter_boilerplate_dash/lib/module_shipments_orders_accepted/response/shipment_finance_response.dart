import 'package:pasco_shipping/utils/logger/logger.dart';

class ShipmentFinanceResponse {
  ShipmentFinanceResponse({
    this.statusCode,
    this.msg,
    this.c,
  });

  String? statusCode;
  String? msg;
  DataFinance? c;


  ShipmentFinanceResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    c =DataFinance.fromJson(json['Data']);
  }

}

class DataFinance{
  DataFinance({
    this.data,
    this.currentTotalCost,
    this.price,this.shippingType,this.weight,this.volume


  });
  List<ShipmentFinanceModel>? data;
  String? currentTotalCost;
  String? price;
  String? shippingType;
  String? shippingCost;
  String? volume ;
  String? weight  ;



  DataFinance.fromJson(Map<String, dynamic> json) {
    try{
      currentTotalCost= json['currentTotalCost'].toString();
      price= json['price'].toString();
      shippingType= json['shippingType'] ??'sea';
       volume = json['volume'].toString() =='null' ? '0' :json['volume'].toString() ;
       weight  = json['weight'].toString() =='null'?'0':json['weight'].toString();
      shippingCost   = json['shippingCost'].toString() =='null'?'0':json['shippingCost'].toString();
    }catch (e, stack) {
      Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
          StackTrace.current);
    }
    if (json['shipmentFinances'] != null) {
      data = <ShipmentFinanceModel>[];
      try {
        data = List<ShipmentFinanceModel>.from(json['shipmentFinances'].map((x) => ShipmentFinanceModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }}

class ShipmentFinanceModel {
  ShipmentFinanceModel({
    this.shipmentID,
    this.stageCost,
    this.stageDescription,
    this.currency,
    this.status,

    this.paymentType,
    this.proxyName,
    // this.chequeNumber,
    this.subcontractName,

    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser
  });

  int? shipmentID;
  String? status;
  int? stageCost;
  int? price;
  String? stageDescription;

  String? currency;

  String? paymentType;
  String? proxyName;
  // String? chequeNumber;
  String? subcontractName;


  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory ShipmentFinanceModel.fromJson(Map<String, dynamic> json) => ShipmentFinanceModel(
    shipmentID: json['shipmentID'],
    stageDescription: json['stageDescription'],

    stageCost: json['stageCost'],
    currency: json['currency'],
    status: json['shipmentStatus'],

    paymentType: json['paymentType'],
    // chequeNumber: json['chequeNumber'],
    subcontractName: json['subcontractName'],
    proxyName: json['proxyName'],

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