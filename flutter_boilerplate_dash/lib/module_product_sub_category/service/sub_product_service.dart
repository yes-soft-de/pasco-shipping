import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_product_sub_category/manager/product_sub_category_manager.dart';
import 'package:pasco_shipping/module_product_sub_category/request/product__sub_caetgory_request.dart';
import 'package:pasco_shipping/module_product_sub_category/response/product__sub_category_response.dart';


@injectable
  class SubProductService {
  final SubProductManager _manager;
  SubProductService(this._manager);

  Future<ConfirmResponse?> createProduct(SubProductRequest request) {
    return _manager.createSubProduct(request);
  }
  Future<ConfirmResponse?> updateProduct(SubProductRequest request) {
    return _manager.updateProduct(request);
  }
  Future<ConfirmResponse?> deleteProduct(String id) {
    return _manager.deleteProduct(id);
  }
  Future<List<SubProductModel>?> getProduct() {
    return _manager.getProducts();
  }
}