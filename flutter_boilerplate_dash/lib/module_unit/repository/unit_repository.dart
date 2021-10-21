
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_unit/request/unit_request.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';

@injectable
class UnitRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  UnitRepository(this._apiClient, this._authService);

  Future<List<UnitModel>?> getUnits() async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.UNITS,
          headers: {'Authorization': 'Bearer $token'});
     UnitResponse markResponse =   UnitResponse.fromJson(response!);
      List<UnitModel>? marks = [];
      if(markResponse.data != null) {
        marks =
            UnitResponse.fromJson(response).data;
      }
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createUnit(UnitRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.UNIT, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = UnitResponse.fromJson(response!).statusCode;
    String? msg = UnitResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteUnit(String id) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    var response = await _apiClient.delete(Urls.UNIT+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = UnitResponse.fromJson(response!).statusCode;
    String? msg = UnitResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> updateUnit(UnitRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.UNIT, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = UnitResponse.fromJson(response!).statusCode;
    String? msg = UnitResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}