
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_airwaybill/request/add_airwaybill_to_travel_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_add_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_change_state_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_request.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_details_response.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_finance_response.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_response.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class AirwaybillRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  AirwaybillRepository(this._apiClient, this._authService);


  Future<ConfirmResponse?> requestAirwaybill(AirwaybillRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.AIRWAYBILL, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = AirwaybillResponse.fromJson(response!).statusCode;
    String? msg = AirwaybillResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
  Future<ConfirmResponse?> updateAirwaybill(AirwaybillRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.AIRWAYBILL, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = AirwaybillResponse.fromJson(response!).statusCode;
    String? msg = AirwaybillResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
  Future<ConfirmResponse?> updateAirwaybillStatusClearedOrArrived(AirwaybillClearedOrArrivedRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.CLEARED_ARRIVED_AIRWAYBILL, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = AirwaybillDetailsResponse.fromJson(response!).statusCode;
    String? msg = AirwaybillDetailsResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteAirwaybill(String id) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    var response = await _apiClient.delete(Urls.AIRWAYBILL+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode =AirwaybillResponse.fromJson(response!).statusCode;
    String? msg = AirwaybillResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }


  Future<AirwaybillDetailsModel?> getAirwaybillDetails(String id) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.AIRWAYBILL + '/' + id,
          headers: {'Authorization': 'Bearer $token'});
      AirwaybillDetailsModel? model = AirwaybillDetailsResponse
          .fromJson(response!)
          .data;
      return model;
    }catch(_){
      return null;
    }

  }

  Future<List<AirwaybillModel>?> getAirwaybillWithFilter(AirwaybillFilterRequest filters) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.AIRWAYBILL_FILTER,filters.toJson(),
          headers: {'Authorization': 'Bearer $token'}
          );
      AirwaybillResponse travelResponse =  AirwaybillResponse.fromJson(response!);
      List<AirwaybillModel>? travels = [];
      if(travelResponse.data != null) {
        travels =
            AirwaybillResponse.fromJson(response).data;
      }
      return travels;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> updateAirwaybillStatus(AirwaybillChangeStateRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.AIRWAYBILL_STATUS, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = AirwaybillDetailsResponse.fromJson(response!).statusCode;
    String? msg = AirwaybillDetailsResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }


  Future<ConfirmResponse?> uploadedAirwaybillToTravel(AddAirwaybillToTravelRequest request) async {
    // await _authService.refreshToken();
    var token =await _authService.getToken();

    var response = await _apiClient.put(Urls.UPLOADED_CONTAINER_TO_TRAVEL, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = AirwaybillDetailsResponse.fromJson(response!).statusCode;
    String? msg = AirwaybillDetailsResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<Data?> getAirwaybillFinance(AirwaybillFilterFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_Airwaybill_FINANCE,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});

      Data? model = AirwaybillFinanceResponse
          .fromJson(response!).c;
      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ConfirmResponse?> createAirwaybillFinance(AirwaybillAddFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_Airwaybill_FINANCE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = AirwaybillFinanceResponse.fromJson(response!).statusCode;
    String? msg = AirwaybillFinanceResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

}



//
  // Future<ConfirmResponse?> updateTravel(TravelRequest request) async {
  //   // await _authService.refreshToken();
  //   var token = Urls.token;  //await _authService.getToken();
  //
  //   var response = await _apiClient.put(Urls.SUPPLIER, request.toJson(),
  //       headers: {'Authorization': 'Bearer $token'});
  //   String? statusCode = TravelResponse.fromJson(response!).statusCode;
  //   String? msg = TravelResponse.fromJson(response).msg;
  //   if(statusCode =='204'){
  //     return ConfirmResponse(true, msg!);
  //   }else {
  //     return ConfirmResponse(false, msg!);
  //   }
  // }
