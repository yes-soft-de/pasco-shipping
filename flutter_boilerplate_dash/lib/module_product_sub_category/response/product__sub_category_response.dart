
import 'package:pasco_shipping/utils/logger/logger.dart';


class SubProductResponse {
  SubProductResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<SubProductModel>? data;

  SubProductResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <SubProductModel>[];
      try {
        data = List<SubProductModel>.from(json['Data'].map((x) => SubProductModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class SubProductModel {
  SubProductModel({
    this.id,
    this.name,
    this.description,
    this.hscode,
    this.productCategoryName,



    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
  });

  int? id;
  String? name;
  String? description;
  String? hscode;
  String? productCategoryName;


  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;


  factory SubProductModel.fromJson(Map<String, dynamic> json) => SubProductModel(
    id: json['id'],
    name: json['name']??'',
    description: json['description']??'',
    hscode: json['hsCode']??'',
    productCategoryName :json['productCategoryName']??'',


    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    updatedByUser: json['createdByUser'],

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









