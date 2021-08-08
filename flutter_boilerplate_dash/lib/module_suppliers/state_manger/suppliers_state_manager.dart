
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_suppliers/request/suppliers_request.dart';
import 'package:pasco_shipping/module_suppliers/service/suppliers_service.dart';
import 'package:pasco_shipping/module_suppliers/ui/state/suppliers_state/suppliers_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class SupplierStateManager{
  final SupplierService _service;

  final PublishSubject<SuppliersState> _stateSubject = PublishSubject();
  Stream<SuppliersState> get stateStream => _stateSubject.stream;

  SupplierStateManager(this._service);

  void getSuppliers(){
    _stateSubject.add(LoadingState());
    _service.getSuppliers().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  void deleteSupplier(String id){
    _stateSubject.add(LoadingState());
    _service.deleteSupplier(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getSuppliers().then((marks) {
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

  void updateSupplier(SupplierRequest request){
    _stateSubject.add(LoadingState());
    _service.updateSupplier(request).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getSuppliers().then((marks) {
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