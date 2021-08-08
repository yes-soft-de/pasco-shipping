import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AddUnitState{}

class InitAddState extends AddUnitState{}
class LoadingAddState extends AddUnitState{}

class SuccessfullyAddState extends AddUnitState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddUnitState{
  String error;

  ErrorAddState(this.error);
}