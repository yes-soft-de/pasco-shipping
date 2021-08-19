
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/measured_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/received_deliered_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipemnt_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/stored_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_details_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/accepted_shipment_status_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/shipment_finance_response.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/response/warehouse_response.dart';

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
        AcceptedShipmentResponse.fromJson(response).data!.data!;
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

  Future<List<AcceptedShipmentStatusModel>?> getAcceptedShipmentStatus(String id ,String trackNumber) async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.ACCEPTED_SHIPMENTS_STATUS + '/'+ id+'/'+trackNumber,headers: {'Authorization': 'Bearer $token'});

      AcceptedShipmentStatusResponse waitingShipmentResponse =  AcceptedShipmentStatusResponse.fromJson(response!);
      List<AcceptedShipmentStatusModel> marks = [];
      if(waitingShipmentResponse.data != null) {
        marks =
        AcceptedShipmentStatusResponse.fromJson(response).data!;
      }
      print(marks.length);
      return marks;
    } catch (e) {
      print(e);
      return null;
    }
  }
  Future<List<WarehouseModel>?> getWarehouses(String cityName) async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.WAREHOUSES ,headers: {'Authorization': 'Bearer $token'});

      WarehouseResponse waitingShipmentResponse =  WarehouseResponse.fromJson(response!);
      List<WarehouseModel> marks = [];
      List<WarehouseModel> warehouses = [];
      if(waitingShipmentResponse.data != null) {
        marks =
        WarehouseResponse.fromJson(response).data!;
        // for(WarehouseModel item  in marks){
        //   if(item.city ==cityName) {
        //     warehouses.add(item);
        //   }
        // }
      }
      print("lenght" + marks.length.toString());
      return marks;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ConfirmResponse?> recivedOrDeliverdShipment(ReceivedOrDeliveredRequest request) async{
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.put(Urls.CHANGE_SHIPMENTS_STATUS_RECEIVED, request.toJson()
          ,headers: {'Authorization': 'Bearer $token'});

      String? statusCode = AcceptedShipmentDetailsResponse.fromJson(response!).statusCode;
      String? msg = AcceptedShipmentDetailsResponse.fromJson(response).msg;
      if(statusCode =='204'){
        return ConfirmResponse(true, msg!);
      }else {
        return ConfirmResponse(false, msg!);
      }

  }catch(_){
      return null;
    }
    }

  Future<ConfirmResponse?> measuredShipment(MeasuredRequest request) async{
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.put(Urls.ACCEPTED_SHIPMENTS_DETAILS, request.toJson()
          ,headers: {'Authorization': 'Bearer $token'});

      String? statusCode = AcceptedShipmentDetailsResponse.fromJson(response!).statusCode;
      String? msg = AcceptedShipmentDetailsResponse.fromJson(response).msg;
      if(statusCode =='204'){
        return ConfirmResponse(true, msg!);
      }else {
        return ConfirmResponse(false, msg!);
      }

    }catch(_){
      return null;
    }
  }

  Future<ConfirmResponse?> storedShipment(StoredRequest request) async{
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.STORED_SHIPMENT, request.toJson()
          ,headers: {'Authorization': 'Bearer $token'});

      String? statusCode = AcceptedShipmentDetailsResponse.fromJson(response!).statusCode;
      String? msg = AcceptedShipmentDetailsResponse.fromJson(response).msg;
      if(statusCode =='201'){
        return ConfirmResponse(true, msg!);
      }else {
        return ConfirmResponse(false, msg!);
      }

    }catch(_){
      return null;
    }
  }



  Future<DataFinance?> getShipmentFinance(ShipmentFilterFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_SHIPMENT_FINANCE,request.toJson()
        ,  headers: {'Authorization': 'Bearer $token'});
      DataFinance? model = ShipmentFinanceResponse
          .fromJson(response!).c;
      return model;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createShipmentFinance(ShipmentFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_SHIPMENT_FINANCE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ShipmentFinanceResponse.fromJson(response!).statusCode;
    String? msg = ShipmentFinanceResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

}