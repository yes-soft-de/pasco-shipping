
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/urls.dart';
import 'package:pasco_shipping/module_profile/request/profile_request.dart';
import 'package:pasco_shipping/module_profile/service/profile_service.dart';
import 'package:pasco_shipping/module_profile/ui/state/profile_state.dart';
import 'package:pasco_shipping/module_upload/service/image_upload/image_upload_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ProfileStateManager {
  final ProfileService _profileService;
  final ImageUploadService _uploadService;
  final PublishSubject<ProfileState> _stateSubject = PublishSubject();
  Stream<ProfileState> get stateStream => _stateSubject.stream;

  ProfileStateManager(this._profileService, this._uploadService);

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
    if(request.image.isEmpty){
      _profileService.updateProfile(request).then((modelUpdated) {
        if(modelUpdated != null) {
          _stateSubject.add(FetchedProfileSuccessfullyState(modelUpdated));
        }else {
          _stateSubject.add(ErrorProfileState('connection error'));
        }
      });
    }else {
      _uploadService
          .uploadImage(request.image).then((value) {
        if (value != null) {
          request.image =value;
          _profileService.updateProfile(request).then((modelUpdated) {
            if(modelUpdated != null) {
              _stateSubject.add(FetchedProfileSuccessfullyState(modelUpdated));
            }else {
              _stateSubject.add(ErrorProfileState('connection error'));
            }
          });
        }else{
          _stateSubject.add(ErrorProfileState('connection error'));
        }
      });
    }

  }
}