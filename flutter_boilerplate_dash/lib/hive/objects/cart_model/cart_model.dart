import 'package:hive/hive.dart';
part 'cart_model.g.dart';
@HiveType(typeId: 0)
class CartModel extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  String? name;

  CartModel({required this.id,this.name});
}