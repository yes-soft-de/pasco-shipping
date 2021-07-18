import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_suppliers/response/suppliers_response.dart';

class SuppliersState{}


class LoadingState extends SuppliersState{}

class SuccessfullyFetchState extends SuppliersState{
  List<SupplierModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

class SuccessfullyModifyState extends SuppliersState{
  ConfirmResponse response;
  List<SupplierModel> proxies;

  SuccessfullyModifyState(this.response, this.proxies);
}

class ErrorState extends SuppliersState{
  String error;

  ErrorState(this.error);
}