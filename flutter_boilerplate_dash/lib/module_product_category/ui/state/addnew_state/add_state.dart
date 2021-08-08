import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AddProductState{}

class InitAddState extends AddProductState{}
class LoadingAddState extends AddProductState{}

class SuccessfullyAddState extends AddProductState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddProductState{
  String error;

  ErrorAddState(this.error);
}