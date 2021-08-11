import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_proxies/proxies_module.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';

class AddWarehouseState{}

class InitAddState extends AddWarehouseState{
  List<ProxyModel> proxies;
  List<SubcontractModel> subcontracts;
  List<CountryModel> country;

  InitAddState(this.proxies, this.subcontracts ,this.country);
}
class LoadingAddState extends AddWarehouseState{}

class SuccessfullyAddState extends AddWarehouseState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddWarehouseState{
  String error;

  ErrorAddState(this.error);
}