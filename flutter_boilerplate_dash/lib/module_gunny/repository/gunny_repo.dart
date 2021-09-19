import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_general/response/confirm_response.dart';
import 'package:pasco_shipping/module_gunny/request/add_shipment_to_gunny_request.dart';
import 'package:pasco_shipping/module_gunny/request/filter_gunny_request.dart';
import 'package:pasco_shipping/module_gunny/response/gunny_response.dart';
import 'package:pasco_shipping/module_gunny/response/stored_response.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';

@injectable
class GunnyRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  GunnyRepository(this._apiClient, this._authService);

  Future<List<GunnyModel>?> getGunny() async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      FilterGunnyRequest request =FilterGunnyRequest(status: 'notfull');
      var response = await _apiClient.post(Urls.GET_GUNNY,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      GunnyResponse markResponse =  GunnyResponse.fromJson(response!);
      List<GunnyModel>? marks = [];
      if(markResponse.data != null) {
        marks =
            GunnyResponse.fromJson(response).data;
      }
      return marks;
    } catch (_) {
      return null;
    }
  }

  Future<List<GunnyModel>?> createGunny() async {
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.CREATE_GUNNY, {},
        headers: {'Authorization': 'Bearer $token'});
    GunnyResponse responsee = GunnyResponse.fromJson(response!);
    List<GunnyModel>? marks = [];
    if(responsee.statusCode =='201'){

      if(responsee.data != null) {
        marks = responsee.data;
      }
      return marks;
    }else {
      return marks;
    }
  }



  Future<StoredModel?> addShipmentToGunny(AddShipmentToGunnyRequest request) async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();

    var response = await _apiClient.post(Urls.ADD_SHIPMENT_TO_GUNNY, request.toJson(),
        headers: {'Authorization': 'Bearer $token'});
    StoredResponse responsee = StoredResponse.fromJson(response!);
    if(responsee.statusCode =='201'){
      return responsee.data;
    }else {
      return null;
    }
  }



}