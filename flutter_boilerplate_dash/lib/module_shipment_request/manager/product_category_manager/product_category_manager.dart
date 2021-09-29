import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';
import 'package:pasco_shipping/module_shipment_request/repository/product_category_repository/product_category_repository.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';

@injectable
class FirstOptionManager{
  final FirstOptionRepository _repository;
  FirstOptionManager(this._repository);

  Future<List<ProductModel>?> getCategories() => _repository.getProduct();
  Future<List<Countries>?> getWarehouses() => _repository.getWarehouses();
  Future<List<Countries>?> getCountriesImport() => _repository.getCountriesImport();
  Future<ConfirmResponse?> addShipment(ShipmentRequest request) => _repository.addNewShipment(request);
}