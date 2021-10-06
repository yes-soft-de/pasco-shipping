import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shifting_shipment/response/shipment_shifting_response.dart';

class ShiftingState{}


class LoadingState extends ShiftingState{}

class SuccessfullyFetchState extends ShiftingState{
  List<ShipmentShiftingModel> shipments;

  SuccessfullyFetchState(this.shipments);
}

class SuccessfullyModifyState extends ShiftingState{
  ConfirmResponse response;
  List<ShipmentShiftingModel> shipments;

  SuccessfullyModifyState(this.response, this.shipments);
}

class ErrorState extends ShiftingState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}