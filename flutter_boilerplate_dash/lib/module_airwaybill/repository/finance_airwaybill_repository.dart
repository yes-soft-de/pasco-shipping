import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_add_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_filter_finance_request.dart';
import 'package:pasco_shipping/module_airwaybill/response/airwaybill_finance_response.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class FinanceAirwaybillRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  FinanceAirwaybillRepository(this._apiClient, this._authService);



  Future<Data?> getAirwaybillLCLFinance(AirwaybillFilterFinanceRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_Airwaybill_LCL_FINANCE,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});

      Data? model = AirwaybillFinanceResponse
          .fromJson(response!).c;
      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }
  Future<Data?> getAirwaybillFCLFinance(AirwaybillFilterFinanceRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_Airwaybill_FCL_FINANCE,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});

      Data? model = AirwaybillFinanceResponse
          .fromJson(response!).c;
      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ConfirmResponse?> createAirwaybillLCLFinance(AirwaybillAddFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_Airwaybill_LCL_FINANCE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = AirwaybillFinanceResponse.fromJson(response!).statusCode;
    String? msg = AirwaybillFinanceResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
  Future<ConfirmResponse?> createAirwaybillFCLFinance(AirwaybillAddFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_Airwaybill_FCL_FINANCE, request.toJson(),
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