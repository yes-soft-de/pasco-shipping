
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill_specification/request/airwaybill_specification_request.dart';
import 'package:pasco_shipping/module_airwaybill_specification/service/airwaybill_specification_service.dart';
import 'package:pasco_shipping/module_airwaybill_specification/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddAirwaybillSpecificationStateManager{
  final AirwaybillSpecificationService _service;

  final PublishSubject<AddAirwaybillSpecificationState> _addStateSubject = PublishSubject();
  Stream<AddAirwaybillSpecificationState> get stateStream => _addStateSubject.stream;

  AddAirwaybillSpecificationStateManager(this._service);

  void createAirwaybillSpecification(AirwaybillSpecificationRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.createAirwaybillSpecification(request).then((value) {
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