import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_product_category/manager/product_category_manager.dart';
import 'package:pasco_shipping/module_product_category/request/product_caetgory_request.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';


@injectable
  class ProductService {
  final ProductManager _manager;
  ProductService(this._manager);

  Future<ConfirmResponse?> createProduct(ProductRequest request) {
    return _manager.createProduct(request);
  }
  Future<ConfirmResponse?> updateProduct(ProductRequest request) {
    return _manager.updateProduct(request);
  }
  Future<ConfirmResponse?> deleteProduct(String id) {
    return _manager.deleteProduct(id);
  }
  Future<List<ProductModel>?> getProduct() {
    return _manager.getProducts();
  }
}