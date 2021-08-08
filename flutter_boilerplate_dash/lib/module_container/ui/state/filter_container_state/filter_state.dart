import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';

class FilterContainerState{}

class InitFilterState extends FilterContainerState{
  List<SubcontractModel> subcontracts;
  InitFilterState({required  this.subcontracts});
}
class LoadingFilterState extends FilterContainerState{}

// class SuccessfullyAddState extends FilterTravelState{
//   ConfirmResponse response;
//
//   SuccessfullyAddState(this.response);
// }

class ErrorFilterState extends FilterContainerState{
  String error;

  ErrorFilterState(this.error);
}