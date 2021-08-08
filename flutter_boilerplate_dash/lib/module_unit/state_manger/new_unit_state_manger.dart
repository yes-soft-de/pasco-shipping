
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_unit/request/unit_request.dart';
import 'package:pasco_shipping/module_unit/service/unit_service.dart';
import 'package:pasco_shipping/module_unit/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddUnitStateManager{
  final UnitService _service;

  final PublishSubject<AddUnitState> _addStateSubject = PublishSubject();
  Stream<AddUnitState> get stateStream => _addStateSubject.stream;

  AddUnitStateManager(this._service);

  void createUnit(UnitRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.createUnit(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _addStateSubject.add(SuccessfullyAddState(value));
        }
        else{
          _addStateSubject.add(ErrorAddState('error'));
        }
      }else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
}