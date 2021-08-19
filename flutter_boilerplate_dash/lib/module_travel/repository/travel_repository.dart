
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_travel/request/travel_add_finance_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_change_state_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_finance_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_filter_request.dart';
import 'package:pasco_shipping/module_travel/request/travel_request.dart';
import 'package:pasco_shipping/module_travel/response/travel_details_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_finance_response.dart';
import 'package:pasco_shipping/module_travel/response/travel_response.dart';

@injectable
class TravelRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  TravelRepository(this._apiClient, this._authService);

  Future<List<TravelModel>?> getTravelsByTypeAndStatus(String type,String status) async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.TRAVELS +'/'+type +'/'+status,
          headers: {'Authorization': 'Bearer $token'});
      List<TravelModel>? marks =
          TravelResponse.fromJson(response!).data;
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createTravel(TravelRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.post(Urls.TRAVEL, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = TravelResponse.fromJson(response!).statusCode;
    String? msg = TravelResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteTravel(String id) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();
    var response = await _apiClient.delete(Urls.TRAVEL+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode =TravelResponse.fromJson(response!).statusCode;
    String? msg = TravelResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }


  Future<TravelDetailsModel?> getTravelDetails(String id) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.TRAVEL + '/' + id,
          headers: {'Authorization': 'Bearer $token'});
      TravelDetailsModel? model = TravelDetailsResponse
          .fromJson(response!)
          .data;
      return model;
    }catch(_){
      return null;
    }

  }

  Future<List<TravelModel>?> getTravelsWithFilter(TravelFilterRequest filters) async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.FILTER_TRAVEL,filters.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      TravelResponse travelResponse =  TravelResponse.fromJson(response!);
      List<TravelModel>? travels = [];
      if(travelResponse.data != null) {
        travels =
          TravelResponse.fromJson(response).data;
      }
      return travels;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> updateTravelStatus(TravelChangeStateRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.put(Urls.TRAVEL_STATUS, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = TravelDetailsResponse.fromJson(response!).statusCode;
    String? msg = TravelDetailsResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }


  Future<Data?> getTravelFinance(TravelFilterFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_Travel_FINANCE,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});

      Data? model = TravelFinanceResponse
          .fromJson(response!).c;
      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ConfirmResponse?> createTravelFinance(TravelAddFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_Travel_FINANCE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = TravelFinanceResponse.fromJson(response!).statusCode;
    String? msg = TravelFinanceResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
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
}