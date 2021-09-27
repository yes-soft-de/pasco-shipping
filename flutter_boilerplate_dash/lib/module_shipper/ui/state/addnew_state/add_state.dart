import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AddShipperState{}

class InitAddState extends AddShipperState{}
class LoadingAddState extends AddShipperState{}

class SuccessfullyAddState extends AddShipperState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddShipperState{
  String error;

  ErrorAddState(this.error);
}