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
  // Future<ConfirmResponse?> updateSupplier(SupplierRequest request) {
  //   return _manager.updateSupplier(request);
  // }
  // Future<ConfirmResponse?> deleteSupplier(String id) {
  //   return _manager.deleteSupplier(id);
  // }
  Future<List<EmployeeModel>?> getEmployees() {
    return _manager.getEmployees();
  }
}