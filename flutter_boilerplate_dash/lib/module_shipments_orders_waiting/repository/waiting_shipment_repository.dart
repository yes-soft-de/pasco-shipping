
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/request/accepted_rejected_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/request/waiting_shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/response/waiting_shipment_response.dart';

@injectable
class WaitingShipmentRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  WaitingShipmentRepository(this._apiClient, this._authService);

  Future<List<WaitingShipmentModel>?> getWaitingShipmentFilter(WaitingShipmentFilterRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.WAITING_SHIPMENTS_FILTER ,request.toJson()
          ,headers: {'Authorization': 'Bearer $token'});

      WaitingShipmentResponse waitingShipmentResponse =  WaitingShipmentResponse.fromJson(response!);
      List<WaitingShipmentModel> marks = [];
      if(waitingShipmentResponse.data != null) {
        marks =
           WaitingShipmentResponse.fromJson(response).data!.data!;
      }
      print(marks.length);
      return marks;
    } catch (e) {
      print(e);
      return null;
    }
  }


  Future<ConfirmResponse?> acceptedOrRejectedShipment(AcceptedOrRejectedRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.put(Urls.ACCEPTED_REJECTED_SHIPMENT, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = WaitingShipmentResponse.fromJson(response!).statusCode;
    String? msg = WaitingShipmentResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}