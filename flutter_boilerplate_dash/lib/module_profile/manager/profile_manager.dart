

import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_profile/repository/profile_repository.dart';
import 'package:pasco_shipping/module_profile/request/profile_request.dart';
import 'package:pasco_shipping/module_profile/response/profile_response.dart';

@injectable
class ProfileManager{
  final ProfileRepository _repository;
  ProfileManager(this._repository);

  Future<ProfileModel?> getProfile() => _repository.getProfile();
  Future<ProfileModel?> updateProfile(ProfileRequest request) => _repository.updateProfile(request);
}