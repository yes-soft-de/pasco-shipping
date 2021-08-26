import 'package:pasco_shipping/module_employees/response/employees_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

class EmployeesState{}


class LoadingState extends EmployeesState{}

class SuccessfullyFetchState extends EmployeesState{
  List<EmployeeModel> distributors;

  SuccessfullyFetchState(this.distributors);
}

class SuccessfullyModifyState extends EmployeesState{
  ConfirmResponse response;
  List<EmployeeModel> proxies;

  SuccessfullyModifyState(this.response, this.proxies);
}

class ErrorState extends EmployeesState{
  String error;

  ErrorState(this.error);
}