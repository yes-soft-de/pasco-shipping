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


// class ProductCategoriesResponse2 {
//   String? statusCode;
//   String? msg;
//   List<Category2>? data;
//
//   ProductCategoriesResponse2({this.statusCode, this.msg, this.data});
//
//   ProductCategoriesResponse2.fromJson(Map<String, dynamic> json) {
//     statusCode = json['status_code'];
//     msg = json['msg'];
//     if (json['Data'] != null) {
//       data = <Category2>[];
//       try {
//         data = List<Category2>.from(json['Data'].map((x) => Category2.fromJson(x)));
//       } catch (e, stack) {
//         Logger().error('Network Error', '${e.toString()}:\n${stack.toString()}',
//             StackTrace.current);
//       }
//     }
//   }
//
// }
// class Category2 {
//   Category2({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.HsCode,
//    required this.isSelected,
//   });
//
//   int id;
//   String name;
//   String description;
//   String HsCode;
//   bool isSelected;
//
//   factory Category2.fromJson(Map<String, dynamic> json) => Category2(
//     id: json['id'],
//     name: json['name'],
//     HsCode: json['hscode'],
//     description: json['description'], isSelected: false,
//   );
//
//   Map<String, dynamic> toJson() => {
//     'id': id,
//     'name': name,
//     'description': description,
//     'hscode':hashCode
//   };
// }


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