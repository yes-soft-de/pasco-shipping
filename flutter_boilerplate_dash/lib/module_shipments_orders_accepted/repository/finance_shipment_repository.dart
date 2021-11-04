
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/deliered_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/measured_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/receiver_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipemnt_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/stored_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_status_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/gunny_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/shipment_finance_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/warehouse_response.dart';

@injectable
class FinanceShipmentRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  FinanceShipmentRepository(this._apiClient, this._authService);


  Future<DataFinance?> getShipmentLCLFinance(ShipmentLCLFilterFinanceRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_SHIPMENT_LCL_FINANCE,request.toJson()
          ,  headers: {'Authorization': 'Bearer $token'});
      DataFinance? model = ShipmentFinanceResponse
          .fromJson(response!).c;
      return model;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createShipmentFinance(ShipmentLCLFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_SHIPMENT_FINANCE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ShipmentFinanceResponse.fromJson(response!).statusCode;
    String? msg = ShipmentFinanceResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }



  Future<DataFinance?> getShipmentFCLFinance(ShipmentLCLFilterFinanceRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_SHIPMENT_FCL_FINANCE,request.toJson()
          ,  headers: {'Authorization': 'Bearer $token'});
      DataFinance? model = ShipmentFinanceResponse
          .fromJson(response!).c;
      return model;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createShipmentFCLFinance(ShipmentLCLFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_SHIPMENT_FCL_FINANCE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ShipmentFinanceResponse.fromJson(response!).statusCode;
    String? msg = ShipmentFinanceResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}