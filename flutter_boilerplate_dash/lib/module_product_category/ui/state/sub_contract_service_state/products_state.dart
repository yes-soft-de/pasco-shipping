import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';

class ProductState{}


class LoadingState extends ProductState{}

class SuccessfullyFetchState extends ProductState{
  List<ProductModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

class SuccessfullyModifyState extends ProductState{
  ConfirmResponse response;
  List<ProductModel> proxies;

  SuccessfullyModifyState(this.response, this.proxies);
}

class ErrorState extends ProductState{
  String error;

  ErrorState(this.error);
}