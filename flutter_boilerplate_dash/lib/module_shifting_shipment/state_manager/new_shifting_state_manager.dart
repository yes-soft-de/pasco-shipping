import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/shifting_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/service/shift_service.dart';
import 'package:pasco_shipping/module_shifting_shipment/ui/state/new_shifting_state/new_shifing_state.dart';
import 'package:pasco_shipping/module_shipment_request/service/shipment_request_service/first_option_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class NewShiftingStateManager {
  final ShiftingService _service;
  final FirstOptionService _wareHouse;

  final PublishSubject<NewShiftingState> _stateSubject = PublishSubject();
  Stream<NewShiftingState> get stateStream => _stateSubject.stream;

  NewShiftingStateManager(this._service, this._wareHouse);

  void getWarehouse (){
    _wareHouse.getWarehouse().then((value) {
      if(value != null){
        _stateSubject.add(SuccessfullyInitState(value));
      }else {
        _stateSubject.add(ErrorAddState(''));
      }
    });
  }
  void createShift(ShiftingRequest request){
    _stateSubject.add(LoadingState());
    _service.createShift(request).then((value) {
      if(value != null ){
        if(value.isConfirmed){
          _stateSubject.add(SuccessfullyAddState(value));
        }
      }else{
        _stateSubject.add(ErrorAddState(''));
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