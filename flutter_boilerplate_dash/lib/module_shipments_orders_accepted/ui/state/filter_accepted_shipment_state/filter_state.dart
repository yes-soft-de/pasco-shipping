import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';

class FilterAcceptedShipmentState{}

class InitFilterState extends FilterAcceptedShipmentState{
  List<CountryModel> countries;
  List<ClientModel> clients;

  InitFilterState(this.countries , this.clients);
}

class LoadingFilterState extends FilterAcceptedShipmentState{}

class ErrorFilterState extends FilterAcceptedShipmentState{
  String error;

  ErrorFilterState(this.error);
}