
import 'package:pasco_shipping/utils/logger/logger.dart';


class ProductResponse {
  ProductResponse({
    this.statusCode,
    this.msg,
    this.data,
  });

  String? statusCode;
  String? msg;
  List<ProductModel>? data;

  ProductResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <ProductModel>[];
      try {
        data = List<ProductModel>.from(json['Data'].map((x) => ProductModel.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}

class ProductModel {
  ProductModel({
    this.id,
    this.name,
    this.description,
    this.hscode,
    this.subs,



    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
    this.createdByUser
  });

  int? id;
  String? name;
  String? description;
  String? hscode;
  List<SubProductModel>? subs;

  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    hscode: json['hsCode'],
    subs:List<SubProductModel>.from(json['subProductCategories'].map((x) => SubProductModel.fromJson(x))) ,


    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    updatedByUser: json['updatedByUser'],
    createdByUser: json['createdByUser'],

  );
}


class SubProductModel {
  SubProductModel({
    this.id,
    this.name,
    this.description,
    this.hscode,
    this.productCategoryID,
    // this.subProduct,




    this.createdAt,
    this.updatedAt,
    this.updatedByUser,
  });

  int? id;
  String? name;
  String? description;
  String? hscode;
  int? productCategoryID;

  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;

  // List<SubProductModel>? subProduct;


  factory SubProductModel.fromJson(Map<String, dynamic> json) => SubProductModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    hscode: json['hscode'],
    productCategoryID: json['productCategoryID'],
    // subProduct:List<SubProductModel>.from(json['subProductCategories'].map((x) => SubProductModel.fromJson(x))) ,

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









