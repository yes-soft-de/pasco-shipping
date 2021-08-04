
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';

@injectable
class AcceptedShipmentRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  AcceptedShipmentRepository(this._apiClient, this._authService);

  Future<List<AcceptedShipmentModel>?> getAcceptedShipment(AcceptedShipmentFilterRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.ACCEPTED_SHIPMENTS, request.toJson()
          ,headers: {'Authorization': 'Bearer $token'});

      AcceptedShipmentResponse waitingShipmentResponse =  AcceptedShipmentResponse.fromJson(response!);
      List<AcceptedShipmentModel> marks = [];
      if(waitingShipmentResponse.data != null) {
        marks =
        AcceptedShipmentResponse.fromJson(response).data!;
      }
      print(marks.length);
      return marks;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<AcceptedShipmentDetailsModel?> getShipmentDetails(String id) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.ACCEPTED_SHIPMENTS_DETAILS + '/' + id,
          headers: {'Authorization': 'Bearer $token'});
      AcceptedShipmentDetailsModel? model = AcceptedShipmentDetailsResponse
          .fromJson(response!).acceptedShipmentModel;
      return model;
    }catch(_){
      return null;
    }

  }

}