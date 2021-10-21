
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_distributors/request/distributors_request.dart';
import 'package:pasco_shipping/module_distributors/response/distributors_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class DistributorRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  DistributorRepository(this._apiClient, this._authService);

  Future<List<DistributorModel>?> getDistributors() async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.DISTRIBUTORS,
          headers: {'Authorization': 'Bearer $token'});
      DistributorResponse responses =  DistributorResponse.fromJson(response!);
      List<DistributorModel>? travels = [];
      if(responses.data != null) {
        travels =
            DistributorResponse.fromJson(response).data;
      }
      return travels;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createDistributor(DistributorRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.DISTRIBUTOR, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = DistributorResponse.fromJson(response!).statusCode;
    String? msg = DistributorResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteDistributor(String id) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    var response = await _apiClient.delete(Urls.DISTRIBUTOR+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = DistributorResponse.fromJson(response!).statusCode;
    String? msg = DistributorResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> updateDistributor(DistributorRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.DISTRIBUTOR, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = DistributorResponse.fromJson(response!).statusCode;
    String? msg = DistributorResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}