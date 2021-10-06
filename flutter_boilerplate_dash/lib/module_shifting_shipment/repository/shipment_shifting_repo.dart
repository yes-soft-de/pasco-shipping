import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/filter_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/shifting_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/update_shifting_status_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/response/shipment_shifting_response.dart';

@injectable
class ShiftingRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  ShiftingRepository(this._apiClient, this._authService);


  Future<ConfirmResponse?> createShift(ShiftingRequest request) async {
    var token = await _authService.getToken();
    var response = await _apiClient.post(Urls.ORDER_SHIFTING, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ShipmentShiftingResponse.fromJson(response!).statusCode;
    String? msg = ShipmentShiftingResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteShift(String id) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    var response = await _apiClient.delete(Urls.DELETE_ORDER_SHIFTING+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode =ShipmentShiftingResponse.fromJson(response!).statusCode;
    String? msg = ShipmentShiftingResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }



  Future<List<ShipmentShiftingModel>?> getShiftingShipment(ShiftingShipmentFilterRequest filters) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.SHIFTING_SHIPMENT,filters.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      ShipmentShiftingResponse travelResponse =  ShipmentShiftingResponse.fromJson(response!);
      List<ShipmentShiftingModel>? travels = [];
      if(travelResponse.data != null) {
        travels =
            ShipmentShiftingResponse.fromJson(response).data;
      }
      return travels;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> updateShiftStatus(UpdateShiftingStatusRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.ORDER_SHIFTING, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    try {
      String? statusCode = ShipmentShiftingResponse.fromJson(response!).statusCode;
      String? msg = ShipmentShiftingResponse.fromJson(response).msg;
      if(statusCode =='204'){
        return ConfirmResponse(true, msg!);
      }else {
        return ConfirmResponse(false, msg!);
      }
    }catch(_){
      return ConfirmResponse(false,'error');
    }

  }
}