import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_employees/manager/employees_manager.dart';
import 'package:pasco_shipping/module_employees/request/employees_request.dart';
import 'package:pasco_shipping/module_employees/response/employees_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';


@injectable
  class EmployeeService {
  final EmployeeManager _manager;
  EmployeeService(this._manager);

  Future<ConfirmResponse?> createEmployee(EmployeeRequest request) {
    return _manager.createEmployee(request);
  }
    Future<EmployeeModel?> getEmployeeProfile() {
      return _manager.getEmployeeProfile();
    }
   Future<ConfirmResponse?> updateEmployee(EmployeeRequest request) {
     return _manager.updateEmployee(request);
   }
  Future<ConfirmResponse?> updateEmployeeRole(EmployeeRequestRole request) {
    return _manager.updateEmployeeRole(request);
  }
  Future<ConfirmResponse?> deleteEmployee(String id) {
    return _manager.deleteEmployee(id);
  }
  Future<List<EmployeeModel>?> getEmployees() {
    return _manager.getEmployees();
  }
}