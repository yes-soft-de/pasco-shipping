
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_unit/response/unit_response.dart';

@injectable
class UnitRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  UnitRepository(this._apiClient, this._authService);

  Future<List<UnitModel>?> getUnits() async {
    var token = await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.UNITS,
          headers: {'Authorization': 'Bearer $token'});
      UnitResponse markResponse =  UnitResponse.fromJson(response!);
      List<UnitModel>? marks = [];
      if(markResponse.data != null){
        marks =  UnitResponse.fromJson(response).data;
      }
      return marks;
    } catch (_) {
      return null;
    }
  }

}