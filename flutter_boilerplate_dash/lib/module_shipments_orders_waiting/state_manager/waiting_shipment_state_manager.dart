import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/service/waiting_shipment_service.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/ui/state/waiting_shipment_state/wainting_shipment_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class WaitingShipmentsStateManager {
  final WaitingShipmentService _service;

  final PublishSubject<WaitingShipmentsState> _stateSubject = PublishSubject();
  Stream<WaitingShipmentsState> get stateStream => _stateSubject.stream;

  WaitingShipmentsStateManager(this._service);

  void getWaitingShipment(String type) {
    _stateSubject.add(LoadingState());
    _service.getWaitingShipment(type).then((value) {
      print(value);
      if (value != null && value.isNotEmpty) {
        _stateSubject.add(SuccessfullyFetchState(value));
      } else if(value!.isEmpty) {
        _stateSubject.add(ErrorState('No Data' , true));
      }else {
        _stateSubject.add(ErrorState('Error' , false));
      }
    });
  }
}