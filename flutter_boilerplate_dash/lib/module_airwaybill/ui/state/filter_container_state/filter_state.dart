import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';

class FilterAirwaybillState{}

class InitFilterState extends FilterAirwaybillState{
  List<SubcontractModel> subcontracts;
  InitFilterState({required  this.subcontracts});
}
class LoadingFilterState extends FilterAirwaybillState{}

// class SuccessfullyAddState extends FilterTravelState{
//   ConfirmResponse response;
//
//   SuccessfullyAddState(this.response);
// }

class ErrorFilterState extends FilterAirwaybillState{
  String error;

  ErrorFilterState(this.error);
}