
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_shipper/request/shipper_request.dart';
import 'package:pasco_shipping/module_shipper/response/shipper_response.dart';

@injectable
class ShipperRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  ShipperRepository(this._apiClient, this._authService);

  Future<List<ShipperModel>?> getShipper() async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.SHIPPERS,
          headers: {'Authorization': 'Bearer $token'});
     ShipperResponse markResponse =  ShipperResponse.fromJson(response!);
      List<ShipperModel>? marks = [];
      if(markResponse.data != null) {
        marks =
            ShipperResponse.fromJson(response).data;
      }
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createShipper(ShipperRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.SHIPPER, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ShipperResponse.fromJson(response!).statusCode;
    String? msg = ShipperResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteShipper(String id) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    var response = await _apiClient.delete(Urls.SHIPPER+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ShipperResponse.fromJson(response!).statusCode;
    String? msg = ShipperResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> updateShipper(ShipperRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.SHIPPER, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ShipperResponse.fromJson(response!).statusCode;
    String? msg = ShipperResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}