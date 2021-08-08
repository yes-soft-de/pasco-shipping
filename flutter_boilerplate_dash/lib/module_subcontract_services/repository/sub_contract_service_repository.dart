
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_subcontract_services/request/sub_contract_service_request.dart';
import 'package:pasco_shipping/module_subcontract_services/response/sub_contract_service_response.dart';

@injectable
class SubContractServiceRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  SubContractServiceRepository(this._apiClient, this._authService);

  Future<List<SubContractServiceModel>?> getSubContractServices() async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.SUB_CONTRACT_SERVICES,
          headers: {'Authorization': 'Bearer $token'});
      List<SubContractServiceModel>? marks =
          SubContractServiceResponse.fromJson(response!).data;
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createSubContractService(SubContractServiceRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.post(Urls.SUB_CONTRACT_SERVICE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = SubContractServiceResponse.fromJson(response!).statusCode;
    String? msg = SubContractServiceResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteSubContractService(String id) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();
    var response = await _apiClient.delete(Urls.SUB_CONTRACT_SERVICE+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = SubContractServiceResponse.fromJson(response!).statusCode;
    String? msg = SubContractServiceResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> updateSubContractService(SubContractServiceRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.put(Urls.SUB_CONTRACT_SERVICE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = SubContractServiceResponse.fromJson(response!).statusCode;
    String? msg = SubContractServiceResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}