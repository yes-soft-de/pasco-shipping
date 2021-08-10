import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AddClientState{}

class InitAddState extends AddClientState{}
class LoadingAddState extends AddClientState{}

class SuccessfullyAddState extends AddClientState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddClientState{
  String error;

  ErrorAddState(this.error);
}