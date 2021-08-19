
import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill_specification/service/airwaybill_specification_service.dart';
import 'package:pasco_shipping/module_airwaybill_specification/ui/state/airwaybillSpecifications_state/airwaybillSpecification_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AirwaybillSpecificationStateManager{
  final AirwaybillSpecificationService _service;

  final PublishSubject<AirwaybillSpecificationsState> _stateSubject = PublishSubject();
  Stream<AirwaybillSpecificationsState> get stateStream => _stateSubject.stream;

  AirwaybillSpecificationStateManager(this._service);

  void getAirwaybillSpecification(){
    _stateSubject.add(LoadingState());
    _service.getAirwaybillSpecification().then((marks) {
      print(marks);
      if(marks != null) {
        _stateSubject.add(SuccessfullyFetchState(marks));
      }else {
        _stateSubject.add(ErrorState('error'));
      }
    });

  }

  // void deleteSupplier(String id){
  //   _stateSubject.add(LoadingState());
  //   _service.deleteSupplier(id).then((value) {
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