import 'package:pasco_shipping/utils/helpers/status_code_helper.dart';
import 'package:pasco_shipping/utils/logger/logger.dart';

class ContainerFinanceResponse {
  ContainerFinanceResponse({
    this.statusCode,
    this.msg,
    this.c,
  });

  String? statusCode;
  String? msg;
  Data? c;


  ContainerFinanceResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    c =Data.fromJson(json['Data']);
  }

}

class Data{
  Data({
    this.data,
    this.currentTotalCost,
    this.currentTotalSellingCost,
    this.currentTotalBuyingCost


});
List<ContainerFinanceModel>? data;
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
      if (json['containerFinances'] != null) {
  data = <ContainerFinanceModel>[];
  try {
  data = List<ContainerFinanceModel>.from(json['containerFinances'].map((x) => ContainerFinanceModel.fromJson(x)));
  } catch (e, stack) {
  Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
  StackTrace.current);
  }
}
}}

class ContainerFinanceModel {
  ContainerFinanceModel({
    this.containerID,
    this.stageCost,
    this.stageDescription,
    this.currency,
    this.status,
    this.paymentType,
    this.financialFundName,
    this.chequeNumber,
    this.subcontractName,
this.buyingCost,this.sellingCost,
    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser
  });

  int? containerID;
  String? status;
  int? stageCost;
  int? buyingCost;
  int? sellingCost;
  String? stageDescription;

  String? currency;
  String? paymentType;
  String? financialFundName;
  String? chequeNumber;
  String? subcontractName;

  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory ContainerFinanceModel.fromJson(Map<String, dynamic> json) => ContainerFinanceModel(
    containerID: json['containerID'],
    stageDescription: json['stageDescription'],

sellingCost: json['sellingCost'] ??0,
buyingCost: json['buyingCost']??0,
    stageCost: json['stageCost']??0,
    currency: json['currency'],
    status : StatusCodeHelper.addStageNameFinance( json['status']),
    paymentType: json['paymentType'],
    chequeNumber: json['chequeNumber'],
    subcontractName: json['subcontractName'],
    financialFundName: json['financialFundName'],

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
