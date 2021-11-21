
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_employees/request/employees_request.dart';
import 'package:pasco_shipping/module_employees/response/employees_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class EmployeeRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  EmployeeRepository(this._apiClient, this._authService);

  Future<List<EmployeeModel>?> getEmployees() async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.EMPLOYEES,
          headers: {'Authorization': 'Bearer $token'});
      EmployeeResponse responses =  EmployeeResponse.fromJson(response!);
      List<EmployeeModel>? travels = [];
      if(responses.data != null) {
        travels =
            EmployeeResponse.fromJson(response).data;
      }
      return travels;
    } catch (_) {
      return null;
    }
  }

  Future<EmployeeModel?> getEmployeesProfile() async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.EMPLOYEE_PROFILE,
          headers: {'Authorization': 'Bearer $token'});
      EmployeeModel? marks =
      OneEmployeeResponse.fromJson(response!).data;
      return marks;
    } catch (e) {
      print('Porfile_model');
      print(e);
      return null;
    }
  }

  Future<ConfirmResponse?> createEmployees(EmployeeRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.EMPLOYEE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = EmployeeResponse.fromJson(response!).statusCode;
    String? msg = EmployeeResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteEmployees(String id) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    var response = await _apiClient.delete(Urls.ADMIN+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = EmployeeResponse.fromJson(response!).statusCode;
    String? msg = EmployeeResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> updateEmployees(EmployeeRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.UPDATE_EMPLOYEE_PROFILE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = EmployeeResponse.fromJson(response!).statusCode;
    String? msg = EmployeeResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
  Future<ConfirmResponse?> updateEmployeesRole(EmployeeRequestRole request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.UPDATE_EMPLOYEE_ROLE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = EmployeeResponse.fromJson(response!).statusCode;
    String? msg = EmployeeResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}