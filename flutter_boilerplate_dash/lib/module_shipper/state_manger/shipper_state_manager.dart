
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipper/request/shipper_request.dart';
import 'package:pasco_shipping/module_shipper/service/shipper_service.dart';
import 'package:pasco_shipping/module_shipper/ui/state/shipper_state/shipper_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ShipperStateManager{
  final ShipperService _service;

  final PublishSubject<ShippersState> _stateSubject = PublishSubject();
  Stream<ShippersState> get stateStream => _stateSubject.stream;

  ShipperStateManager(this._service);

  void getSuppliers(){
    _stateSubject.add(LoadingState());
    _service.getShippers().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  void deleteShipper(String id){
    _stateSubject.add(LoadingState());
    _service.deleteShipper(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getShippers().then((marks) {
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

  void updateShipper(ShipperRequest request){
    _stateSubject.add(LoadingState());
    _service.updateShipper(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getShippers().then((marks) {
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