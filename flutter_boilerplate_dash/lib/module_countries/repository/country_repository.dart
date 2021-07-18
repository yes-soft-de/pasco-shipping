
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_countries/request/country_request.dart';
import 'package:pasco_shipping/module_countries/response/country_response.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_mark/request/mark_request.dart';
import 'package:pasco_shipping/module_mark/response/mark_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class CountryRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  CountryRepository(this._apiClient, this._authService);

  Future<List<CountryModel>?> getCountries() async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.COUNTRIES,
          headers: {'Authorization': 'Bearer $token'});
      List<CountryModel>? marks =
          CountryResponse.fromJson(response!).data;
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createCountry(CountryRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.post(Urls.COUNTRY, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = MarkResponse.fromJson(response!).statusCode;
    String? msg = MarkResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteCountry(String id) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();
    var response = await _apiClient.delete(Urls.COUNTRY+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = CountryResponse.fromJson(response!).statusCode;
    String? msg = CountryResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> updateCountry(CountryRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token;  //await _authService.getToken();

    var response = await _apiClient.put(Urls.COUNTRY, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = CountryResponse.fromJson(response!).statusCode;
    String? msg = CountryResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}