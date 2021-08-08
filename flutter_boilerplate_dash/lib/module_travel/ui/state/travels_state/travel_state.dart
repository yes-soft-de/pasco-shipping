import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';

class TravelsState{}


class LoadingState extends TravelsState{}

class SuccessfullyFetchState extends TravelsState{
  List<TravelModel> travels;

  SuccessfullyFetchState(this.travels);
}

class SuccessfullyModifyState extends TravelsState{
  ConfirmResponse response;
  List<TravelModel> travels;

  SuccessfullyModifyState(this.response, this.travels);
}

class ErrorState extends TravelsState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}