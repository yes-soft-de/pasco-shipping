
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_proxies/request/proxies_request.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';

@injectable
class ProxyRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  ProxyRepository(this._apiClient, this._authService);

  Future<List<ProxyModel>?> getProxies() async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.PROXIES,
          headers: {'Authorization': 'Bearer $token'});
      List<ProxyModel>? marks =
          ProxyResponse.fromJson(response!).data;
      return marks;
    } catch (e) {
      print('catch error');
      print(e);
      return null;
    }
  }

  Future<ConfirmResponse?> createProxy(ProxyRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.PROXY, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ProxyResponse.fromJson(response!).statusCode;
    String? msg = ProxyResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteProxy(String id) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    var response = await _apiClient.delete(Urls.PROXY+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ProxyResponse.fromJson(response!).statusCode;
    String? msg = ProxyResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> updateProxy(ProxyRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.PROXY, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ProxyResponse.fromJson(response!).statusCode;
    String? msg = ProxyResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}