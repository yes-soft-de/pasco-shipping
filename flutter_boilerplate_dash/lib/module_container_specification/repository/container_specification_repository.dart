
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_container_specification/request/container_specification_request.dart';
import 'package:pasco_shipping/module_container_specification/response/container_specification_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class ContainerSpecificationRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  ContainerSpecificationRepository(this._apiClient, this._authService);

  Future<List<ContainerSpecificationModel>?> getContainerSpecification() async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.CONTAINER_SPECIFICATIONS,
          headers: {'Authorization': 'Bearer $token'});
      List<ContainerSpecificationModel>? marks =
          ContainerSpecificationResponse.fromJson(response!).data;
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createContainerSpecification(ContainerSpecificationRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.post(Urls.CONTAINER_SPECIFICATION, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ContainerSpecificationResponse.fromJson(response!).statusCode;
    String? msg = ContainerSpecificationResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  // Future<ConfirmResponse?> deleteSupplier(String id) async {
  //   // await _authService.refreshToken();
  //   var token = Urls.token;  //await _authService.getToken();
  //   var response = await _apiClient.delete(Urls.SUPPLIER+'/'+id,
  //       headers: {'Authorization': 'Bearer $token'});
  //   String? statusCode = SupplierResponse.fromJson(response!).statusCode;
  //   String? msg = SupplierResponse.fromJson(response).msg;
  //   if(statusCode =='401'){
  //     return ConfirmResponse(true, msg!);
  //   }else {
  //     return ConfirmResponse(false, msg!);
  //   }
  // }
  //
  // Future<ConfirmResponse?> updateSupplier(SupplierRequest request) async {
  //   // await _authService.refreshToken();
  //   var token = Urls.token;  //await _authService.getToken();
  //
  //   var response = await _apiClient.put(Urls.SUPPLIER, request.toJson(),
  //       headers: {'Authorization': 'Bearer $token'});
  //   String? statusCode = SupplierResponse.fromJson(response!).statusCode;
  //   String? msg = SupplierResponse.fromJson(response).msg;
  //   if(statusCode =='204'){
  //     return ConfirmResponse(true, msg!);
  //   }else {
  //     return ConfirmResponse(false, msg!);
  //   }
  // }
}