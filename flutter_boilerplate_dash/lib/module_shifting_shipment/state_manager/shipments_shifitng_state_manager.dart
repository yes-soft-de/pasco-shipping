import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/filter_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/request/update_shifting_status_request.dart';
import 'package:pasco_shipping/module_shifting_shipment/service/shift_service.dart';
import 'package:pasco_shipping/module_shifting_shipment/ui/state/shipment_shifting_state/shifitng_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class ShipmentsShiftingStateManager {
  final ShiftingService _service;

  final PublishSubject<ShiftingState> _stateSubject = PublishSubject();
  Stream<ShiftingState> get stateStream => _stateSubject.stream;

  ShipmentsShiftingStateManager(this._service);


  void getShiftingShipment(ShiftingShipmentFilterRequest request) {
    _stateSubject.add(LoadingState());
    _service.getShiftingShipment(request).then((value) {
      if (value != null && value.isNotEmpty) {
        _stateSubject.add(SuccessfullyFetchState(value));
      } else if(value!.isEmpty) {
        _stateSubject.add(ErrorState('No Data' , true));
      }else {
        _stateSubject.add(ErrorState('Error' , false));
      }
    });
  }

  void updateStatus(UpdateShiftingStatusRequest request) {
    _stateSubject.add(LoadingState());
    _service.updateShiftStatus(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          ShiftingShipmentFilterRequest  request5 = ShiftingShipmentFilterRequest();
          _service.getShiftingShipment(request5).then((marks) {
            if (marks != null && marks.isNotEmpty) {
              _stateSubject.add(SuccessfullyFetchState(marks));
            } else if(marks!.isEmpty) {
              _stateSubject.add(ErrorState('No Data' , true));
            }else {
              _stateSubject.add(ErrorState('error' , false));
            }
          });
        }
      } else {
        _stateSubject.add(ErrorState('error' , false));
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
