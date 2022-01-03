import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/response/price_response.dart';

@injectable
class PriceRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  PriceRepository(this._apiClient , this._authService);

  Future<PriceModel?> getPrice() async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.PRICE,
          headers: {'Authorization': 'Bearer $token'});
      PriceModel? profileModel =
          PriceResponse.fromJson(response!).data;
      return profileModel;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> updateContainerPrice(ContainerPriceRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.put(Urls.UPDATE_CONTAINER_PRICE,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      String? statusCode = PriceResponse.fromJson(response!).statusCode;
      String? msg = PriceResponse.fromJson(response).msg;
      if(statusCode =='204'){
        print('Here');
        return ConfirmResponse(true, msg!);
      }else {
        return ConfirmResponse(false, msg!);
      }
    } catch (_) {
      return null;
    }
  }


  Future<ConfirmResponse?> createShippingLinePrice(ShippingLinePriceRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.PRICE,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      String? statusCode = PriceResponse.fromJson(response!).statusCode;
      String? msg = PriceResponse.fromJson(response).msg;
      if(statusCode =='201'){
        return ConfirmResponse(true, msg!);
      }else {
        return ConfirmResponse(false, msg!);
      }
    } catch (_) {
      return null;
    }
  }
  Future<ConfirmResponse?> updateShippingLinePrice(ShippingLinePriceRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.put(Urls.PRICE,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      String? statusCode = PriceResponse.fromJson(response!).statusCode;
      String? msg = PriceResponse.fromJson(response).msg;
      if(statusCode =='204'){
        return ConfirmResponse(true, msg!);
      }else {
        return ConfirmResponse(false, msg!);
      }
    } catch (_) {
      return null;
    }
  }

}