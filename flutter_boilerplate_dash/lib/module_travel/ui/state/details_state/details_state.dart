import 'package:pasco_shipping/module_travel/response/travel_details_response.dart';

class TravelDetailsState{}

class InitDetailsState extends TravelDetailsState{}
class LoadingDetailsState extends TravelDetailsState{}

class SuccessfullyDetailsState extends TravelDetailsState{
  TravelDetailsModel response;

  SuccessfullyDetailsState(this.response);
}

class ErrorDetailsState extends TravelDetailsState{
  String error;

  ErrorDetailsState(this.error);
}