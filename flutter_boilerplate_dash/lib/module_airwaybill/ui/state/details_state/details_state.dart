import 'package:pasco_shipping/module_airwaybill/response/airwaybill_details_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';

class AirwaybillDetailsState{}

class InitDetailsState extends AirwaybillDetailsState{}
class LoadingDetailsState extends AirwaybillDetailsState{}

class SuccessfullyDetailsState extends AirwaybillDetailsState{
  AirwaybillDetailsModel response;
  SuccessfullyDetailsState(this.response);
}
class SuccessfullyDetailsWithTravelsState extends AirwaybillDetailsState{
  AirwaybillDetailsModel response;
  // List<TravelModel> travels;
  SuccessfullyDetailsWithTravelsState(this.response);
}
class SuccessfullyUploadedContainerState extends AirwaybillDetailsState{
  ConfirmResponse response;

  SuccessfullyUploadedContainerState(this.response);
}
class ErrorDetailsState extends AirwaybillDetailsState{
  String error;

  ErrorDetailsState(this.error);
}