import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_product_sub_category/response/product__sub_category_response.dart';

class SubProductState{}


class LoadingState extends SubProductState{}

class SuccessfullyFetchState extends SubProductState{
  List<SubProductModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

class SuccessfullyModifyState extends SubProductState{
  ConfirmResponse response;
  List<SubProductModel> proxies;

  SuccessfullyModifyState(this.response, this.proxies);
}

class ErrorState extends SubProductState{
  String error;

  ErrorState(this.error);
}