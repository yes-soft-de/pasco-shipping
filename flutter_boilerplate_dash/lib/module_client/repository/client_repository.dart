
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_client/request/create_client_request.dart';
import 'package:pasco_shipping/module_client/response/client_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class ClientRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  ClientRepository(this._apiClient, this._authService);

  Future<List<ClientModel>?> getClients() async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.GET_CLIENTS,
          headers: {'Authorization': 'Bearer $token'});
      List<ClientModel>? marks =
          ClientResponse.fromJson(response!).data;
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createClient(CreateClientRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.post(Urls.CREATE_CLIENT_ACCOUNT, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ClientResponse.fromJson(response!).statusCode;
    String? msg = ClientResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  // Future<ConfirmResponse?> deleteUnit(String id) async {
  //   // await _authService.refreshToken();
  //   var token = Urls.token;  //await _authService.getToken();
  //   var response = await _apiClient.delete(Urls.UNIT+'/'+id,
  //       headers: {'Authorization': 'Bearer $token'});
  //   String? statusCode = UnitResponse.fromJson(response!).statusCode;
  //   String? msg = UnitResponse.fromJson(response).msg;
  //   if(statusCode =='401'){
  //     return ConfirmResponse(true, msg!);
  //   }else {
  //     return ConfirmResponse(false, msg!);
  //   }
  // }
  //
  // Future<ConfirmResponse?> updateUnit(UnitRequest request) async {
  //   // await _authService.refreshToken();
  //   var token = Urls.token;  //await _authService.getToken();
  //
  //   var response = await _apiClient.put(Urls.UNIT, request.toJson(),
  //       headers: {'Authorization': 'Bearer $token'});
  //   String? statusCode = UnitResponse.fromJson(response!).statusCode;
  //   String? msg = UnitResponse.fromJson(response).msg;
  //   if(statusCode =='204'){
  //     return ConfirmResponse(true, msg!);
  //   }else {
  //     return ConfirmResponse(false, msg!);
  //   }
  // }
}