import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_active_shipment_response.dart';
import 'package:pasco_shipping/module_my_shipment/response/my_history_shipment_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class MyShipmentRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  MyShipmentRepository(this._apiClient, this._authService);

  Future<List<MyShipment>?> getMyActiveShipment() async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.MY_SHIPMENT+'/'+'undelivered',
          headers: {'Authorization': 'Bearer $token'});
      List<MyShipment>? myActiveShipments =
          MyShipmentResponse.fromJson(response!).data;
      return myActiveShipments;
    } catch (_) {
      return null;
    }
  }

  Future<List<MyHistoryShipment>?> getMyDeliveredShipment() async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.MY_SHIPMENT+'/'+'delivered',
          headers: {'Authorization': 'Bearer $token'});
      List<MyHistoryShipment>? myDeliveredShipments =
          MyHistoryShipmentResponse.fromJson(response!).data;
      return myDeliveredShipments;
    } catch (_) {
      return null;
    }
  }

  Future<List<MyHistoryShipment>?> getMyWaitingShipment() async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.MY_WAITING_SHIPMENT,
          headers: {'Authorization': 'Bearer $token'});
      List<MyHistoryShipment>? myDeliveredShipments =
          MyHistoryShipmentResponse.fromJson(response!).data;
      return myDeliveredShipments;
    } catch (_) {
      return null;
    }
  }

}