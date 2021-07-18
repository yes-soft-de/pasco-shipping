import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AddProxyState{}

class InitAddState extends AddProxyState{}
class LoadingAddState extends AddProxyState{}

class SuccessfullyAddState extends AddProxyState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddProxyState{
  String error;

  ErrorAddState(this.error);
}