import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AddSupplierState{}

class InitAddState extends AddSupplierState{}
class LoadingAddState extends AddSupplierState{}

class SuccessfullyAddState extends AddSupplierState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddSupplierState{
  String error;

  ErrorAddState(this.error);
}