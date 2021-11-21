
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_employees/request/employees_request.dart';
import 'package:pasco_shipping/module_employees/service/employees_service.dart';
import 'package:pasco_shipping/module_employees/ui/state/addnew_state/add_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddEmployeeStateManager{
  final EmployeeService _service;

  final PublishSubject<AddEmployState> _addStateSubject = PublishSubject();
  Stream<AddEmployState> get stateStream => _addStateSubject.stream;

  AddEmployeeStateManager(this._service);

  void createEmployee(EmployeeRequest request){
    _addStateSubject.add(LoadingAddState());
    _service.createEmployee(request).then((value) {
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

  void updateEmployeeRole(EmployeeRequestRole request){
    _addStateSubject.add(LoadingAddState());
    _service.updateEmployeeRole(request).then((value) {
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