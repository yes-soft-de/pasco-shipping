
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_sub_contract/request/subcontract_request.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';

@injectable
class SubcontractRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  SubcontractRepository(this._apiClient, this._authService);

  Future<List<SubcontractModel>?> getSubContracts() async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    try {
      SubcontractRequest  request =SubcontractRequest(serviceName: 'Carrier');
      var response = await _apiClient.post(Urls.SUB_CONTRACTS,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      SubcontractResponse markResponse = SubcontractResponse.fromJson(
          response!);
      List<SubcontractModel>? marks = [];
      if (markResponse.data != null) {
        marks =
            SubcontractResponse
                .fromJson(response)
                .data;
      }
      return marks;
    } catch (_) {
      return null;
    }
  }

}