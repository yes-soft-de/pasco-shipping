
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_unit/request/unit_request.dart';
import 'package:pasco_shipping/module_unit/service/unit_service.dart';
import 'package:pasco_shipping/module_unit/ui/state/units_state/units_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class UnitStateManager{
  final UnitService _service;

  final PublishSubject<UnitsState> _stateSubject = PublishSubject();
  Stream<UnitsState> get stateStream => _stateSubject.stream;

  UnitStateManager(this._service);

  void getUnits(){
    _stateSubject.add(LoadingState());
    _service.getUnits().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  void deleteUnit(String id){
    _stateSubject.add(LoadingState());
    _service.deleteUnit(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getUnits().then((marks) {
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

  void updateUnit(UnitRequest request){
    _stateSubject.add(LoadingState());
    _service.updateUnit(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getUnits().then((marks) {
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