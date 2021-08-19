import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_finance_response.dart';

class FinanceTravelState{}


class LoadingState extends FinanceTravelState{}

class addFinanceSuccessfullyState extends FinanceTravelState{
  ConfirmResponse response;
  addFinanceSuccessfullyState(this.response);
}

class SuccessfullyFetchState extends FinanceTravelState{
  Data  finances;

  SuccessfullyFetchState(this.finances);
}

class ErrorState extends FinanceTravelState{
  String error;
  bool isEmptyData;

  ErrorState(this.error , this.isEmptyData);
}