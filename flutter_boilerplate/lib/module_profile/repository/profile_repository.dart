import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_auth/service/auth_service/auth_service.dart';
import 'package:pasco_shipping/module_network/http_client/http_client.dart';
import 'package:pasco_shipping/module_profile/request/profile_request.dart';
import 'package:pasco_shipping/module_profile/response/profile_response.dart';

@injectable
class ProfileRepository{
  final ApiClient _apiClient;
  final AuthService _authService;

  ProfileRepository(this._apiClient , this._authService);

  Future<ProfileModel?> getProfile() async {
    // await _authService.refreshToken();
    var token = await _authService.getToken();
    try {
      var response = await _apiClient.get(Urls.MY_PROFILE,
          headers: {'Authorization': 'Bearer $token'});
      ProfileModel? profileModel =
          ProfileResponse.fromJson(response!).data;
      return profileModel;
    } catch (_) {
      return null;
    }
  }

  Future<ProfileModel?> updateProfile(ProfileRequest request) async {
    // await _authService.refreshToken();
    var token =  await _authService.getToken();
    try {
      var response = await _apiClient.put(Urls.MY_PROFILE,request.toJson(),
          headers: {'Authorization': 'Bearer $token'});
      ProfileModel? profileModel =
          ProfileResponse.fromJson(response!).data;
      return profileModel;
    } catch (_) {
      return null;
    }
  }
}