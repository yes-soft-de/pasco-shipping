import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class ConfirmedShipmentState{}

class ConfirmInitState extends ConfirmedShipmentState{}

class LoadingState extends ConfirmedShipmentState{}

class ConfirmedState extends ConfirmedShipmentState{
 ConfirmResponse response;

 ConfirmedState(this.response);
}