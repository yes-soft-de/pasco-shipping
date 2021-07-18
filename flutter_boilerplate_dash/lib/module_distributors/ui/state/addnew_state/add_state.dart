import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AddDistributorsState{}

class InitAddState extends AddDistributorsState{}
class LoadingAddState extends AddDistributorsState{}

class SuccessfullyAddState extends AddDistributorsState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddDistributorsState{
  String error;

  ErrorAddState(this.error);
}