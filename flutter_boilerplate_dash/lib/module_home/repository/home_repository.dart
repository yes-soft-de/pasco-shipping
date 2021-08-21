import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_home/response/home_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_profile/request/profile_request.dart';
import 'package:pasco_shipping/module_profile/response/profile_response.dart';

@injectable
class HomeRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  HomeRepository(this._apiClient , this._authService);

  Future<StatisticModel?> getStatistics() async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.STATISTIC,
          headers: {'Authorization': 'Bearer $token'});
      StatisticModel? statistics =
          StatisticResponse.fromJson(response!).data;
      return statistics;
    } catch (_) {
      return null;
    }
  }
}