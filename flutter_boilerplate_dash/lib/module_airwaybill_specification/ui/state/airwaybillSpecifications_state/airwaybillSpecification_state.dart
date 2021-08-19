import 'package:pasco_shipping/module_airwaybill_specification/response/airwaybill_specification_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AirwaybillSpecificationsState{}


class LoadingState extends AirwaybillSpecificationsState{}

class SuccessfullyFetchState extends AirwaybillSpecificationsState{
  List< AirwaybillSpecificationModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

class SuccessfullyModifyState extends AirwaybillSpecificationsState{
  ConfirmResponse response;
  List< AirwaybillSpecificationModel> proxies;

  SuccessfullyModifyState(this.response, this.proxies);
}

class ErrorState extends AirwaybillSpecificationsState{
  String error;

  ErrorState(this.error);
}