
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_profile/manager/profile_manager.dart';
import 'package:pasco_shipping/module_profile/request/profile_request.dart';
import 'package:pasco_shipping/module_profile/response/profile_response.dart';

@injectable
class ProfileService{
  final ProfileManager _manager;
  ProfileService(this._manager);

  Future<ProfileModel?> updateProfile(ProfileRequest request) {
    return _manager.updateProfile(request);
  }
  Future<ProfileModel?> getMyProfile() {
    return _manager.getProfile();
  }
}