
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_employees/service/employees_service.dart';
import 'package:pasco_shipping/module_employees/ui/state/suppliers_state/employees_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class EmployeeStateManager{
  final EmployeeService _service;

  final PublishSubject<EmployeesState> _stateSubject = PublishSubject();
  Stream<EmployeesState> get stateStream => _stateSubject.stream;

  EmployeeStateManager(this._service);

  void getEmployees(){
    _stateSubject.add(LoadingState());
    _service.getEmployees().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  void deleteEmployee(String id){
    _stateSubject.add(LoadingState());
    _service.deleteEmployee(id).then((value) {
      if(value != null){
        if(value.isConfirmed){
          _service.getEmployees().then((marks) {
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
  //
  // void updateSupplier(SupplierRequest request){
  //   _stateSubject.add(LoadingState());
  //   _service.updateSupplier(request).then((value) {
  //     if(value != null){
  //       if(value.isConfirmed){
  //         _service.getSuppliers().then((marks) {
  //           if(marks != null) {
  //             _stateSubject.add(SuccessfullyFetchState(marks));
  //           }else {
  //             _stateSubject.add(ErrorState('error'));
  //           }
  //         });
  //       }
  //     }else {
  //       _stateSubject.add(ErrorState('error'));
  //     }
  //   });
  // }
}