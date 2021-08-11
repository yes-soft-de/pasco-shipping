import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_product_sub_category/repository/product_sub_category_repository.dart';
import 'package:pasco_shipping/module_product_sub_category/request/product__sub_caetgory_request.dart';
import 'package:pasco_shipping/module_product_sub_category/response/product__sub_category_response.dart';

@injectable
class SubProductManager{
  final SubProductRepository _repository;
  SubProductManager(this._repository);

  Future<ConfirmResponse?> createSubProduct(SubProductRequest request) => _repository.createProductCat(request);
  Future<ConfirmResponse?> deleteProduct(String id) => _repository.deleteProduct(id);
  Future<List<SubProductModel>?> getProducts() => _repository.getProduct();
  Future<ConfirmResponse?> updateProduct(SubProductRequest request) => _repository.updateProduct(request);


}