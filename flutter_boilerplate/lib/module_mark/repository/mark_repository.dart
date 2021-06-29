
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_mark/request/mark_request.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class MarkRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  MarkRepository(this._apiClient, this._authService);

  Future<List<Mark>?> getMyMark() async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.MY_MARKS,
          headers: {'Authorization': 'Bearer $token'});
      List<Mark>? marks =
          MarkResponse.fromJson(response!).data;
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createMark(MarkRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.post(Urls.MARK, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = MarkResponse.fromJson(response!).statusCode;
    String? msg = MarkResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteMark(String id) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();
    var response = await _apiClient.delete(Urls.MARK+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = MarkResponse.fromJson(response!).statusCode;
    String? msg = MarkResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}