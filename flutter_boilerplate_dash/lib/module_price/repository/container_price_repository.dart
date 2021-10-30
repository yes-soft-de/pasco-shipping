import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_price/request/price_request.dart';
import 'package:pasco_shipping/module_price/response/container_price_response.dart';
import 'package:pasco_shipping/module_price/response/price_response.dart';

@injectable
class ContainerPriceRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  ContainerPriceRepository(this._apiClient , this._authService);

  Future<List<ContainerPriceModel>?> getContainerPrice() async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.CONTAINER_PRICES,
          headers: {'Authorization': 'Bearer $token'});
      ContainerPriceResponse markResponse =  ContainerPriceResponse.fromJson(response!);
      List<ContainerPriceModel>? marks = [];
      if(markResponse.data != null) {
        marks =
            ContainerPriceResponse.fromJson(response).data;
      }
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> updateContainerPrice(ContainerPriceRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.put(Urls.CONTAINER_PRICE,request.toJson(),
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


  Future<ConfirmResponse?> createContainerPrice(ContainerPriceRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.CONTAINER_PRICE,request.toJson(),
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
}