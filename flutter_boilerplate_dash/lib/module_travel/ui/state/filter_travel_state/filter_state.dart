import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';

class FilterTravelState{}

class InitFilterState extends FilterTravelState{
  List<SubcontractModel> subcontracts;
  List<CountryModel> countries;

  InitFilterState({required  this.subcontracts ,required this.countries});
}
class LoadingFilterState extends FilterTravelState{}

// class SuccessfullyAddState extends FilterTravelState{
//   ConfirmResponse response;
//
//   SuccessfullyAddState(this.response);
// }

class ErrorFilterState extends FilterTravelState{
  String error;

  ErrorFilterState(this.error);
}