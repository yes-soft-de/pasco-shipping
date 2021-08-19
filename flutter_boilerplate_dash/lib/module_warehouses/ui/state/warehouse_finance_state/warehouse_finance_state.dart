import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_warehouses/response/warehouse_finance_response.dart';

class FinanceWarehouseState{}


class LoadingState extends FinanceWarehouseState{}

class addFinanceSuccessfullyState extends FinanceWarehouseState{
  ConfirmResponse response;
  addFinanceSuccessfullyState(this.response);
}

class SuccessfullyFetchState extends FinanceWarehouseState{
  List<WarehouseFinanceModel>  finances;

  SuccessfullyFetchState(this.finances);
}

class ErrorState extends FinanceWarehouseState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}