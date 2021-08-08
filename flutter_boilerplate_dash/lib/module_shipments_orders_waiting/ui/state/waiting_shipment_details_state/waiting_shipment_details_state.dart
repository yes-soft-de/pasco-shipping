import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';

class WaitingShipmentDetailsState{}

class initDetailsState extends WaitingShipmentDetailsState{
  WaitingShipmentModel model;

  initDetailsState(this.model);
}

class LoadingState extends WaitingShipmentDetailsState{}

class SuccessfullyModifyState extends WaitingShipmentDetailsState{
  ConfirmResponse response;
  SuccessfullyModifyState(this.response);
}

class ErrorState extends WaitingShipmentDetailsState{
  String error;

  ErrorState(this.error);
}