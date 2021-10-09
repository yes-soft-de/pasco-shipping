import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shifting_shipment/response/shipment_shifting_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';

class NewShiftingState{}


class LoadingState extends NewShiftingState{}

class SuccessfullyInitState extends NewShiftingState{
  List<Countries> wearhouses;

  SuccessfullyInitState(this.wearhouses);
}

class SuccessfullyAddState extends NewShiftingState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends NewShiftingState{
  String error;

  ErrorAddState(this.error);
}