import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_employees/enums/employee_role.dart';
import 'package:pasco_shipping/module_employees/service/employees_service.dart';
import 'package:pasco_shipping/module_home/presistance/profile_prefs_helper.dart';
import 'package:pasco_shipping/module_home/service/home_service.dart';
import 'package:pasco_shipping/module_home/ui/state/home_state.dart';
import 'package:pasco_shipping/module_profile/request/profile_request.dart';
import 'package:pasco_shipping/module_profile/service/profile_service.dart';
import 'package:pasco_shipping/module_profile/ui/state/profile_state.dart';
import 'package:pasco_shipping/module_warehouses/request/warehouse_filter_request.dart';
import 'package:pasco_shipping/module_warehouses/service/warehouse_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class HomeStateManager {
  // final ProfileService _profileService;
  final HomeService _homeService;
  final EmployeeService _employeeService;

  // final PublishSubject<ProfileState> _stateSubject = PublishSubject();
  // Stream<ProfileState> get stateStream => _stateSubject.stream;

  final PublishSubject<HomeState> _stateSubject = PublishSubject();
  Stream<HomeState> get stateStream => _stateSubject.stream;

  HomeStateManager(this._homeService, this._employeeService);

  void getStatistic(){
    _stateSubject.add(LoadingHomeState());
    _employeeService.getEmployeeProfile().then((employModel){
      if(employModel != null){
        ConstVar.Roles = employModel.roles!;
        _homeService.getStatistic().then((model){
          if(model != null) {
            _stateSubject.add(FetchedHomeSuccessfullyState(model));
          }else {
            _stateSubject.add(ErrorState('connection error'));
          }
        });
      }else {
        _stateSubject.add(ErrorState('connection error'));
      }
    });


  }
  // void getProfile(){
  //   _stateSubject.add(LoadingProfileState());
  //   _profileService.getMyProfile().then((model) {
  //     if(model != null) {
  //       _stateSubject.add(FetchedProfileSuccessfullyState(model));
  //     }else {
  //       _stateSubject.add(ErrorProfileState('connection error'));
  //     }
  //   });
  // }
  // void updateProfile(ProfileRequest request){
  //   _stateSubject.add(LoadingProfileState());
  //   _profileService.updateProfile(request).then((modelUpdated) {
  //     if(modelUpdated != null) {
  //       _stateSubject.add(FetchedProfileSuccessfullyState(modelUpdated));
  //     }else {
  //       _stateSubject.add(ErrorProfileState('connection error'));
  //     }
  //   });
  // }
}