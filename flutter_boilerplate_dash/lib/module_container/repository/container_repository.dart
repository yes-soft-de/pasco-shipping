
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_container/request/add_container_to_travel_request.dart';
import 'package:pasco_shipping/module_container/request/conatiner_filter_finance_request.dart';
import 'package:pasco_shipping/module_container/request/container_add_finance_request.dart';
import 'package:pasco_shipping/module_container/request/container_change_state_request.dart';
import 'package:pasco_shipping/module_container/request/container_filter_request.dart';
import 'package:pasco_shipping/module_container/request/container_request.dart';
import 'package:pasco_shipping/module_container/response/container_details_response.dart';
import 'package:pasco_shipping/module_container/response/container_finance_response.dart';
import 'package:pasco_shipping/module_container/response/container_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class ContainerRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  ContainerRepository(this._apiClient, this._authService);


  Future<ConfirmResponse?> requestContainer(ContainerRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.post(Urls.CONTAINER, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ContainerResponse.fromJson(response!).statusCode;
    String? msg = ContainerResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteContainer(String id) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();
    var response = await _apiClient.delete(Urls.CONTAINER+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode =ContainerResponse.fromJson(response!).statusCode;
    String? msg = ContainerResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }


  Future<ContainerDetailsModel?> getContainerDetails(String id) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.CONTAINER + '/' + id,
          headers: {'Authorization': 'Bearer $token'});
      ContainerDetailsModel? model = ContainerDetailsResponse
          .fromJson(response!)
          .data;
      return model;
    }catch(_){
      return null;
    }

  }

  Future<List<ContainerModel>?> getContainerWithFilter(ContainerFilterRequest filters) async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.CONTAINER_FILTER,filters.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      ContainerResponse travelResponse =  ContainerResponse.fromJson(response!);
      List<ContainerModel>? travels = [];
      if(travelResponse.data != null) {
        travels =
            ContainerResponse.fromJson(response).data;
      }
      return travels;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> updateContainerStatus(ContainerChangeStateRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.put(Urls.CONTAINER_STATUS, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ContainerDetailsResponse.fromJson(response!).statusCode;
    String? msg = ContainerDetailsResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }


  Future<ConfirmResponse?> uploadedContainerToTravel(AddContainerToTravelRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.put(Urls.UPLOADED_CONTAINER_TO_TRAVEL, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ContainerDetailsResponse.fromJson(response!).statusCode;
    String? msg = ContainerDetailsResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
  Future<Data?> getContainerFinance(ContainerFilterFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_Container_FINANCE,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});

      Data? model = ContainerFinanceResponse
          .fromJson(response!).c;
      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ConfirmResponse?> createContainerFinance(ContainerAddFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_Container_FINANCE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ContainerFinanceResponse.fromJson(response!).statusCode;
    String? msg = ContainerFinanceResponse.fromJson(response).msg;
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
