
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_product_category/request/product_caetgory_request.dart';
import 'package:pasco_shipping/module_product_category/response/product_category_response.dart';

@injectable
class ProductRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  ProductRepository(this._apiClient, this._authService);

  Future<List<ProductModel>?> getProduct() async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.PRODUCT_CATEGORIES,
          headers: {'Authorization': 'Bearer $token'});
      ProductResponse markResponse =  ProductResponse.fromJson(response!);
      List<ProductModel>? marks = [];
      if(markResponse.data != null) {
        marks =
            ProductResponse.fromJson(response).data;
      }
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse?> createProductCat(ProductRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_PRODUCT_CATEGORY, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ProductResponse.fromJson(response!).statusCode;
    String? msg = ProductResponse.fromJson(response).msg;
    if(statusCode =='201'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> deleteProduct(String id) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    var response = await _apiClient.delete(Urls.ADD_PRODUCT_CATEGORY+'/'+id,
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ProductResponse.fromJson(response!).statusCode;
    String? msg = ProductResponse.fromJson(response).msg;
    if(statusCode =='401'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }

  Future<ConfirmResponse?> updateProduct(ProductRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.put(Urls.ADD_PRODUCT_CATEGORY, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    String? statusCode = ProductResponse.fromJson(response!).statusCode;
    String? msg = ProductResponse.fromJson(response).msg;
    if(statusCode =='204'){
      return ConfirmResponse(true, msg!);
    }else {
      return ConfirmResponse(false, msg!);
    }
  }
}