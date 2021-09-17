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
    this.currentTotalCost


});
List<ContainerFinanceModel>? data;
String? currentTotalCost;



   Data.fromJson(Map<String, dynamic> json) {
    currentTotalCost= json['currentTotalCost'].toString();
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

    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser
  });

  int? containerID;
  String? status;
  int? stageCost;
  String? stageDescription;

  String? currency;


  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory ContainerFinanceModel.fromJson(Map<String, dynamic> json) => ContainerFinanceModel(
    containerID: json['containerID'],
    stageDescription: json['stageDescription'],

    stageCost: json['stageCost'],
    currency: json['currency'],
    status: json['status'],


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