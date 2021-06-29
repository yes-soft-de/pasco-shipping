import 'package:pasco_shipping/module_profile/response/profile_response.dart';

class ProfileState{}

class ProfileInitState extends ProfileState{}

class LoadingProfileState extends ProfileState{}

class FetchedProfileSuccessfullyState extends ProfileState{
  ProfileModel model;

  FetchedProfileSuccessfullyState(this.model);
}
class ErrorProfileState extends ProfileState{
  String message;

  ErrorProfileState(this.message);
}