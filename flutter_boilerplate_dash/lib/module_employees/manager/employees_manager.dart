import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_employees/repository/employees_repository.dart';
import 'package:pasco_shipping/module_employees/request/employees_request.dart';
import 'package:pasco_shipping/module_employees/response/employees_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';

@injectable
class EmployeeManager{
  final EmployeeRepository _repository;
  EmployeeManager(this._repository);

  Future<ConfirmResponse?> createEmployee(EmployeeRequest request) => _repository.createEmployees(request);
  Future<EmployeeModel?> getEmployeeProfile( ) => _repository.getEmployeesProfile();



  Future<ConfirmResponse?> deleteEmployee(String id) => _repository.deleteEmployees(id);
  Future<List<EmployeeModel>?> getEmployees() => _repository.getEmployees();
  Future<ConfirmResponse?> updateEmployee(EmployeeRequest request) => _repository.updateEmployees(request);


}