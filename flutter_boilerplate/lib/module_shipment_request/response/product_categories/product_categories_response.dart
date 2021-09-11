import 'package:pasco_shipping/utils/logger/logger.dart';

class ProductCategoriesResponse {
  String? statusCode;
  String? msg;
  List<Category>? data;

  ProductCategoriesResponse({this.statusCode, this.msg, this.data});

  ProductCategoriesResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = <Category>[];
      try {
        data = List<Category>.from(json['Data'].map((x) => Category.fromJson(x)));
      } catch (e, stack) {
        Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
            StackTrace.current);
      }
    }
  }

}
class Category {
  Category({
    required this.id,
    required this.name,
    required this.description,
   required this.isSelected,
  });

  int id;
  String name;
  String description;
  bool isSelected;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json['id'],
    name: json['name'],
    description: json['description'], isSelected: false,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
  };
}





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
  List<SubbProductModel>? subs;

  DateTime? createdAt;
  DateTime? updatedAt;
  String? updatedByUser;
  String? createdByUser;


  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    hscode: json['hsCode'],
    subs:List<SubbProductModel>.from(json['subProductCategories'].map((x) => SubbProductModel.fromJson(x))) ,


    createdAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['createdAt']).timestamp! * 1000),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(
        CreatedAt.fromJson(json['updatedAt']).timestamp! * 1000),
    updatedByUser: json['updatedByUser'],
    createdByUser: json['createdByUser'],

  );
}


class SubbProductModel {
  SubbProductModel({
    this.id,
    this.name,
    this.description,
    this.hscode,
    this.productCategoryID,
    required this.isSelected,
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
  bool isSelected;

  // List<SubProductModel>? subProduct;


  factory SubbProductModel.fromJson(Map<String, dynamic> json) => SubbProductModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    hscode: json['hsCode'],
    productCategoryID: json['productCategoryID'],
    isSelected: false,
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
