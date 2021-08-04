import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';

class AddTravelState{}

class InitAddState extends AddTravelState{
  List<SubcontractModel> subcontracts;
  List<CountryModel> countries;

  InitAddState({required  this.subcontracts ,required this.countries});
}
class LoadingAddState extends AddTravelState{}

class SuccessfullyAddState extends AddTravelState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddTravelState{
  String error;

  ErrorAddState(this.error);
}