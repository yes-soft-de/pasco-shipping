
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipper/request/shipper_request.dart';
import 'package:pasco_shipping/module_shipper/service/shipper_service.dart';
import 'package:pasco_shipping/module_shipper/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddShipperStateManager{
  final ShipperService _service;

  final PublishSubject<AddShipperState> _addStateSubject = PublishSubject();
  Stream<AddShipperState> get stateStream => _addStateSubject.stream;

  AddShipperStateManager(this._service);

  void createShipper(ShipperRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.createShipper(request).then((value) {
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