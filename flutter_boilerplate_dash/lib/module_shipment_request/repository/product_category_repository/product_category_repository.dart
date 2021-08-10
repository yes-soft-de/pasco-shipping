import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_general/response/general_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_shipment_request/request/shipment_request.dart';
import 'package:pasco_shipping/module_shipment_request/response/product_categories/product_categories_response.dart';
import 'package:pasco_shipping/module_shipment_request/response/warehouses/wearhouse_response.dart';

@injectable
class FirstOptionRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  FirstOptionRepository(this._apiClient, this._authService);

  Future<List<Category>?> getProductCategories() async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.PRODUCT_CATEGORY,
          headers: {'Authorization': 'Bearer $token'});
      List<Category>? categories =
          ProductCategoriesResponse.fromJson(response!).data;
      return categories;
    } catch (_) {
      return null;
    }
  }

  Future<List<Countries>?> getWarehouses() async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient
          .get(Urls.COUNTRIES, headers: {'Authorization': 'Bearer $token'});
      List<Countries>? warehouses = WarehouseResponse.fromJson(response!).data;
      return warehouses;
    } catch (_) {
      return null;
    }
  }

  Future<ConfirmResponse> addNewShipment(ShipmentRequest request) async {
    // await _authService.refreshToken();
    var token = Urls.token; // await _authService.getToken();
    try {
      var response = await _apiClient.post(Urls.REQUEST_SHIPMENT_ADMIN, request.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      String? statusCode = GeneralResponse.fromJson(response!).statusCode;
      String? msg = GeneralResponse.fromJson(response).msg;
      if(statusCode == '201'){
        return ConfirmResponse(true, msg!);
      }else{
        return ConfirmResponse(false, 'connection error');
      }
    } catch (_) {
      return ConfirmResponse(false, 'connection error');
    }
  }

}
