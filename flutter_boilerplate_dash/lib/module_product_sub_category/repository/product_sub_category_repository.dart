
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_product_sub_category/request/product__sub_caetgory_request.dart';
import 'package:pasco_shipping/module_product_sub_category/response/product__sub_category_response.dart';

@injectable
class SubProductRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  SubProductRepository(this._apiClient, this._authService);

  Future<List<SubProductModel>?> getProduct() async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.SUB_PRODUCT_CATEGORIES,
          headers: {'Authorization': 'Bearer $token'});
      SubProductResponse markResponse =  SubProductResponse.fromJson(response!);
      List<SubProductModel>? marks = [];
      if(markResponse.data != null) {
        marks =
            SubProductResponse.fromJson(response).data;
      }
      return marks;
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createProductCat(SubProductRequest request) async {
    // await _authService.refreshToken();
    var token =await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_SUB_PRODUCT_CATEGORY, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = SubProductResponse.fromJson(response!).statusCode;
    String? msg = SubProductResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteProduct(String id) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    var response = await _apiClient.delete(Urls.ADD_SUB_PRODUCT_CATEGORY+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = SubProductResponse.fromJson(response!).statusCode;
    String? msg = SubProductResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> updateProduct(SubProductRequest request) async {
    // await _authService.refreshToken();
    var token =await _authService.getToken();

    var response = await _apiClient.put(Urls.ADD_SUB_PRODUCT_CATEGORY, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = SubProductResponse.fromJson(response!).statusCode;
    String? msg = SubProductResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}