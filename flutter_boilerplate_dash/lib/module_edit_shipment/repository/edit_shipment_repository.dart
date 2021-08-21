import 'package:analyzer_plugin/protocol/protocol.dart';
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_edit_shipment/request/add_shipment_request.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_general/response/general_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';

@injectable
class EditShipmentRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  EditShipmentRepository(this._apiClient, this._authService);

  Future<ConfirmResponse> addNewShipment(AddShipmentRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.ADD_NEW_SHIPMENT, request.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      String? statusCode = GeneralResponse.fromJson(response!).statusCode;
      String? msg = GeneralResponse.fromJson(response).msg;
      if(statusCode == '201'){
        return ConfirmResponse(true, msg!);
      }else{
        return ConfirmResponse(false, 'connection error');
      }
    } catch (_) {
      return ConfirmResponse(false, 'connection error');
    }
  }
}