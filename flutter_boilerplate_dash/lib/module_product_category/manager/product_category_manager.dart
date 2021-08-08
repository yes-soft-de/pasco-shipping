import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_product_category/repository/product_category_repository.dart';
import 'package:pasco_shipping/module_product_category/request/product_caetgory_request.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';

@injectable
class ProductManager{
  final ProductRepository _repository;
  ProductManager(this._repository);

  Future<ConfirmResponse?> createProduct(ProductRequest request) => _repository.createProductCat(request);
  Future<ConfirmResponse?> deleteProduct(String id) => _repository.deleteProduct(id);
  Future<List<ProductModel>?> getProducts() => _repository.getProduct();
  Future<ConfirmResponse?> updateProduct(ProductRequest request) => _repository.updateProduct(request);


}