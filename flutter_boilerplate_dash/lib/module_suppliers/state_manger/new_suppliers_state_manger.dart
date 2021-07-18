
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_suppliers/request/suppliers_request.dart';
import 'package:pasco_shipping/module_suppliers/service/suppliers_service.dart';
import 'package:pasco_shipping/module_suppliers/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddSupplierStateManager{
  final SupplierService _service;

  final PublishSubject<AddSupplierState> _addStateSubject = PublishSubject();
  Stream<AddSupplierState> get stateStream => _addStateSubject.stream;

  AddSupplierStateManager(this._service);

  void createSupplier(SupplierRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.createSupplier(request).then((value) {
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