import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_container/request/conatiner_filter_finance_request.dart';
import 'package:pasco_shipping/module_container/request/container_add_finance_request.dart';
import 'package:pasco_shipping/module_container/response/container_finance_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class FinanceContainerRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  FinanceContainerRepository(this._apiClient, this._authService);



  Future<Data?> getContainerLCLFinance(ContainerFilterFinanceRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_Container_LCL_FINANCE,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});

      Data? model = ContainerFinanceResponse
          .fromJson(response!).c;
      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }
  Future<Data?> getContainerFCLFinance(ContainerFilterFinanceRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.GET_Container_FCL_FINANCE,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});

      Data? model = ContainerFinanceResponse
          .fromJson(response!).c;
      return model;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<ConfirmResponse?> createContainerLCLFinance(ContainerAddFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_Container_LCL_FINANCE, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ContainerFinanceResponse.fromJson(response!).statusCode;
    String? msg = ContainerFinanceResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
  Future<ConfirmResponse?> createContainerFCLFinance(ContainerAddFinanceRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_Container_FCL_FINANCE, request.toJson(),
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