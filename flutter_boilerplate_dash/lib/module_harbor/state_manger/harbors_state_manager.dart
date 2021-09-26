
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_filter_request.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_request.dart';
import 'package:pasco_shipping/module_harbor/service/harbor_service.dart';
import 'package:pasco_shipping/module_harbor/ui/state/harbors_state/harbors_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class HarborStateManager{
  final HarborService _service;

  final PublishSubject<HarborsState> _stateSubject = PublishSubject();
  Stream<HarborsState> get stateStream => _stateSubject.stream;

  HarborStateManager(this._service);

  void getHarbor(HarborFilterRequest request){
    _stateSubject.add(LoadingState());
    _service.getHarbor(request).then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  void deleteHarbor(String id ,HarborFilterRequest request){
    _stateSubject.add(LoadingState());
    _service.deleteHarbor(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getHarbor(request).then((marks) {
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