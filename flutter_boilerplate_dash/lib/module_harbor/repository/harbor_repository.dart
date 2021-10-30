import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_filter_request.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_request.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class HarborRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  HarborRepository(this._apiClient, this._authService);

  Future<List<HarborModel>?> getHarbors(HarborFilterRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_HARBOR,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      HarborResponse markResponse =  HarborResponse.fromJson(response!);
      List<HarborModel>? marks = [];
      if(markResponse.data != null) {
        marks =
            HarborResponse.fromJson(response).data;
      }
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createHarbors(HarborRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.HARBOR, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = HarborResponse.fromJson(response!).statusCode;
    String? msg = HarborResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteHarbor(String id) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    var response = await _apiClient.delete(Urls.HARBOR+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = HarborResponse.fromJson(response!).statusCode;
    String? msg = HarborResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> updateHarbor(HarborRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.HARBOR, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = HarborResponse.fromJson(response!).statusCode;
    String? msg = HarborResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}