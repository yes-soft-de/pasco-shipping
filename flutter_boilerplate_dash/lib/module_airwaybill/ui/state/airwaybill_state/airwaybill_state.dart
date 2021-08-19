import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class AirwaybillsState{}


class LoadingState extends AirwaybillsState{}

class SuccessfullyFetchState extends AirwaybillsState{
  List<AirwaybillModel> travels;

  SuccessfullyFetchState(this.travels);
}

class SuccessfullyModifyState extends AirwaybillsState{
  ConfirmResponse response;
  List<AirwaybillModel> travels;

  SuccessfullyModifyState(this.response, this.travels);
}

class ErrorState extends AirwaybillsState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}