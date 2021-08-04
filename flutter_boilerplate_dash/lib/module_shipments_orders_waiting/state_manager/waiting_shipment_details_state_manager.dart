import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/request/accepted_rejected_shipment_request.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/service/waiting_shipment_service.dart';
import 'package:pasco_shipping/module_shipments_orders_waiting/ui/state/waiting_shipment_details_state/waiting_shipment_details_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class WaitingShipmentsDetailsStateManager {
  final WaitingShipmentService _service;

  final PublishSubject<WaitingShipmentDetailsState> _stateSubject = PublishSubject();
  Stream<WaitingShipmentDetailsState> get stateStream => _stateSubject.stream;

  WaitingShipmentsDetailsStateManager(this._service);

  void acceptedOrRejectedShipment(AcceptedOrRejectedRequest type) {
    _stateSubject.add(LoadingState());
    _service.acceptedOrRejectedShipment(type).then((value) {
      if (value != null) {
        _stateSubject.add(SuccessfullyModifyState(value));
      }else {
        _stateSubject.add(ErrorState('Error'));
      }
    });
  }
}