
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_add_finance_request.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_filter_finance_request.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_filter_request.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_request.dart';
import 'package:pasco_shipping/module_warehouses/response/warehouse_finance_response.dart';
import 'package:pasco_shipping/module_warehouses/response/warhouse_response.dart';

@injectable
class WarehousesRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  WarehousesRepository(this._apiClient, this._authService);

  Future<List<WarehousesModel>?> getWarehouses(WarehouseFilterRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_FILTER_WAREHOUSES,request.toJson()
          ,headers: {'Authorization': 'Bearer $token'});
      WarehouseResponse markResponse =   WarehouseResponse.fromJson(response!);
      List<WarehousesModel>? marks = [];
      if(markResponse.data != null) {
        marks =
            WarehouseResponse.fromJson(response).data;
      }
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createWarehouses(WarehouseRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.WAREHOUSE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = WarehouseResponse.fromJson(response!).statusCode;
    String? msg = WarehouseResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteWarehouses(String id) async {
    // await _authService.refreshToken();
    var token =await _authService.getToken();
    var response = await _apiClient.delete(Urls.WAREHOUSE+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = WarehouseResponse.fromJson(response!).statusCode;
    String? msg = WarehouseResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> updateWarehouses(WarehouseRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.WAREHOUSE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = WarehouseResponse.fromJson(response!).statusCode;
    String? msg = WarehouseResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }


  Future<List<WarehouseFinanceModel>?> getWarehouseFinance(WarehouseFilterFinanceRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_WAREHOUSES_FINANCE,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});

      List<WarehouseFinanceModel>? marks =[];
      WarehouseFinanceResponse res =
          WarehouseFinanceResponse.fromJson(response!);
      if(res.data != null){
        marks = res.data;
      }
      return marks;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ConfirmResponse?> createWarehouseFinance(WarehouseAddFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_WAREHOUSE_FINANCE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = WarehouseFinanceResponse.fromJson(response!).statusCode;
    String? msg = WarehouseFinanceResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

}