import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipment_request/repository/product_category_repository/product_category_repository.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';

@injectable
class FirstOptionManager{
  final FirstOptionRepository _repository;
  FirstOptionManager(this._repository);

  Future<List<Category>?> getCategories() => _repository.getProductCategories();
  Future<List<Countries>?> getWarehouses() => _repository.getWarehouses();
}