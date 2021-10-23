import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_filter_request.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_request.dart';
import 'package:pasco_shipping/module_harbor/response/harbor_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class HarborRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  HarborRepository(this._apiClient, this._authService);

  Future<List<HarborModel>?> getHarbors(HarborFilterRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_HARBOR, request.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      HarborResponse markResponse = HarborResponse.fromJson(response!);
      List<HarborModel>? marks = [];
      if (markResponse.data != null) {
        marks =
            HarborResponse
                .fromJson(response)
                .data;
      }
      return marks;
    } catch (_) {
      return null;
    }
  }
}