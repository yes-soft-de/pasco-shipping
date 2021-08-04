import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';

class AcceptedShipmentDetailsState{}

class initDetailsState extends AcceptedShipmentDetailsState{
  AcceptedShipmentDetailsModel model;
  initDetailsState(this.model);
}

class LoadingState extends AcceptedShipmentDetailsState{}

class SuccessfullyModifyState extends AcceptedShipmentDetailsState{
  ConfirmResponse response;
  SuccessfullyModifyState(this.response);
}

class ErrorState extends AcceptedShipmentDetailsState{
  String error;

  ErrorState(this.error);
}