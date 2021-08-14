import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';

class WarehousesState{}


class LoadingState extends WarehousesState{}

class SuccessfullyFetchState extends WarehousesState{
  List<WarehousesModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

class SuccessfullyModifyState extends WarehousesState{
  ConfirmResponse response;
  List<WarehousesModel> proxies;

  SuccessfullyModifyState(this.response, this.proxies);
}

class ErrorState extends WarehousesState{
  String error;

  ErrorState(this.error);
}