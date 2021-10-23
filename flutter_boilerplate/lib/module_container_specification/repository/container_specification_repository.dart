
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
    var token = await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.CONTAINER_SPECIFICATIONS,
          headers: {'Authorization': 'Bearer $token'});
      ContainerSpecificationResponse responses =  ContainerSpecificationResponse.fromJson(response!);
      List<ContainerSpecificationModel>? travels = [];
      if(responses.data != null) {
        travels =
            ContainerSpecificationResponse.fromJson(response).data;
      }
      return travels;
    } catch (_) {
      return null;
    }
  }

}