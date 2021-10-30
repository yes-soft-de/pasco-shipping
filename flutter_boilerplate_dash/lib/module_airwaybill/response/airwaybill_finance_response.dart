import 'package:pasco_shipping/utils/logger/logger.dart';

class AirwaybillFinanceResponse {
  AirwaybillFinanceResponse({
    this.statusCode,
    this.msg,
    this.c,
  });

  String? statusCode;
  String? msg;
  Data? c;


  AirwaybillFinanceResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    c =Data.fromJson(json['Data']);
  }

}

class Data{
  Data({
   required this.data,
    this.currentTotalCost,
    this.currentTotalBuyingCost,
    this.currentTotalSellingCost


});
List<AirwaybillFinanceModel> data=[];
String? currentTotalCost;
  String? currentTotalSellingCost;
  String? currentTotalBuyingCost;


   Data.fromJson(Map<String, dynamic> json) {
    currentTotalCost= json['currentTotalCost'].toString();
    try{
      currentTotalSellingCost= json['currentTotalSellingCost'].toString();
      currentTotalBuyingCost= json['currentTotalBuyingCost'].toString();
    } catch (e, stack) {
      Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
          StackTrace.current);
    }
      if (json['airWaybillFinances'] != null) {
  data = <AirwaybillFinanceModel>[];
  try {
  data = List<AirwaybillFinanceModel>.from(json['airWaybillFinances'].map((x) => AirwaybillFinanceModel.fromJson(x)));
  } catch (e, stack) {
    print("nnnnnnnn");
  Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
  StackTrace.current);
  }
}else if (json['airwaybillFinances'] != null){
        data = <AirwaybillFinanceModel>[];
        try {
          data = List<AirwaybillFinanceModel>.from(json['airwaybillFinances'].map((x) => AirwaybillFinanceModel.fromJson(x)));
        } catch (e, stack) {
          print("nnnnnnnn");
          Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
              StackTrace.current);
        }
      }
}}

class AirwaybillFinanceModel {
  AirwaybillFinanceModel({
    this.airwaybillID,
    this.stageCost,
    this.stageDescription,
    this.currency,
    this.status,

    this.paymentType,
    // this.financialFundName,
    // this.chequeNumber,
    this.subcontractName,
    this.sellingCost,
    this.buyingCost,
    this.proxyName,

    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser
  });

  int? airwaybillID;
  String? status;
  int? stageCost;
  int? buyingCost;
  int? sellingCost;
  String? stageDescription;

  String? currency;

  String? paymentType;
  String? proxyName;
  // String? financialFundName;
  // String? chequeNumber;
  String? subcontractName;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory AirwaybillFinanceModel.fromJson(Map<String, dynamic> json) => AirwaybillFinanceModel(
    airwaybillID: json['airwaybillID'],
    stageDescription: json['stageDescription'],

    stageCost: json['stageCost']??0,
    currency: json['currency'],
    status: json['status'],
    buyingCost: json['buyingCost']??0,
    sellingCost: json['sellingCost']??0,

    paymentType: json['paymentType'],
    proxyName: json['proxyName'],
    subcontractName: json['subcontractName'],
    // financialFundName: json['financialFundName'],

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
