
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_profile/request/profile_request.dart';
import 'package:pasco_shipping/module_profile/service/profile_service.dart';
import 'package:pasco_shipping/module_profile/ui/state/profile_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ProfileStateManager {
  final ProfileService _profileService;
  final PublishSubject<ProfileState> _stateSubject = PublishSubject();
  Stream<ProfileState> get stateStream => _stateSubject.stream;

  ProfileStateManager(this._profileService);

  void getProfile(){
    _stateSubject.add(LoadingProfileState());
    _profileService.getMyProfile().then((model) {
      if(model != null) {
        _stateSubject.add(FetchedProfileSuccessfullyState(model));
      }else {
        _stateSubject.add(ErrorProfileState('connection error'));
      }
    });
  }
  void updateProfile(ProfileRequest request){
    _stateSubject.add(LoadingProfileState());
    _profileService.updateProfile(request).then((modelUpdated) {
      if(modelUpdated != null) {
        _stateSubject.add(FetchedProfileSuccessfullyState(modelUpdated));
      }else {
        _stateSubject.add(ErrorProfileState('connection error'));
      }
    });
  }
}