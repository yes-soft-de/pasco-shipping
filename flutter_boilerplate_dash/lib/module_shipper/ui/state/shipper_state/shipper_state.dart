import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipper/response/shipper_response.dart';

class ShippersState{}


class LoadingState extends ShippersState{}

class SuccessfullyFetchState extends ShippersState{
  List<ShipperModel> shippers;

  SuccessfullyFetchState(this.shippers);
}

class SuccessfullyModifyState extends ShippersState{
  ConfirmResponse response;
  List<ShipperModel> shippers;

  SuccessfullyModifyState(this.response, this.shippers);
}

class ErrorState extends ShippersState{
  String error;

  ErrorState(this.error);
}