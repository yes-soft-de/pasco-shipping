import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';

class AddLinesPriceState{}

class InitAddState extends AddLinesPriceState{
  List<Countries> countriesImport;
  List<Countries> countriesExport;

  InitAddState({required this.countriesExport ,required this.countriesImport});
}
class LoadingAddState extends AddLinesPriceState{}

class SuccessfullyAddState extends AddLinesPriceState{
  ConfirmResponse response;

  SuccessfullyAddState(this.response);
}

class ErrorAddState extends AddLinesPriceState{
  String error;

  ErrorAddState(this.error);
}