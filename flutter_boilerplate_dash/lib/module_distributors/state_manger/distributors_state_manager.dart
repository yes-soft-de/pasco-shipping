
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_distributors/request/distributors_request.dart';
import 'package:pasco_shipping/module_distributors/service/distributors_service.dart';
import 'package:pasco_shipping/module_distributors/ui/state/distributors_state/distributors_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class DistributorStateManager{
  final DistributorService _distributorService;

  final PublishSubject<DistributorsState> _stateSubject = PublishSubject();
  Stream<DistributorsState> get stateStream => _stateSubject.stream;

  DistributorStateManager(this._distributorService);

  void getCountries(){
    _stateSubject.add(LoadingState());
    _distributorService.getDistributors().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  void deleteDistributor(String id){
    _stateSubject.add(LoadingState());
    _distributorService.deleteDistributor(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _distributorService.getDistributors().then((marks) {
            if(marks != null) {
              _stateSubject.add(SuccessfullyFetchState(marks));
            }else {
              _stateSubject.add(ErrorState('error'));
            }
          });
        }
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });
  }

  void updateDistributor(DistributorRequest request){
    _stateSubject.add(LoadingState());
    _distributorService.updateDistributor(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _distributorService.getDistributors().then((marks) {
            if(marks != null) {
              _stateSubject.add(SuccessfullyFetchState(marks));
            }else {
              _stateSubject.add(ErrorState('error'));
            }
          });
        }
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });
  }
}