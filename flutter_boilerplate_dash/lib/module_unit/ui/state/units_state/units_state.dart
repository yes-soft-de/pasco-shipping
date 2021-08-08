import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';

class UnitsState{}


class LoadingState extends UnitsState{}

class SuccessfullyFetchState extends UnitsState{
  List<UnitModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

class SuccessfullyModifyState extends UnitsState{
  ConfirmResponse response;
  List<UnitModel> proxies;

  SuccessfullyModifyState(this.response, this.proxies);
}

class ErrorState extends UnitsState{
  String error;

  ErrorState(this.error);
}