import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_shipment_track/response/tracking_response.dart';

@injectable
class TrackingRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  TrackingRepository(this._apiClient , this._authService);

  Future<TrackModel?> getTrackDetails(String trackNumber) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    var response;
    try {
      response = await _apiClient.get(Urls.TRACK_SHIPMENT + '/'+trackNumber,
          headers: {'Authorization': 'Bearer $token'});
      TrackModel? model =
          TrackResponse.fromJson(response!).data;
      return model;
    } catch (_) {
      return null;
    }
  }
}