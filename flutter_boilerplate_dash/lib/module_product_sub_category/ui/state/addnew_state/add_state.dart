import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';

class AddSubProductState{}

class InitAddState extends AddSubProductState{
  List<ProductModel> products;

  InitAddState(this.products);
}
class LoadingAddState extends AddSubProductState{}

class SuccessfullyAddState extends AddSubProductState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddSubProductState{
  String error;

  ErrorAddState(this.error);
}