import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/service/accepted_shipment_service.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_details_state/accepted_shipment_details_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AcceptedShipmentsDetailsStateManager {
  final AcceptedShipmentService _service;

  final PublishSubject<AcceptedShipmentDetailsState> _stateSubject = PublishSubject();
  Stream<AcceptedShipmentDetailsState> get stateStream => _stateSubject.stream;

  AcceptedShipmentsDetailsStateManager(this._service);

  void getDetailsShipment(String id) {
    _stateSubject.add(LoadingState());
    _service.getShipmentDetails(id).then((value) {
      if (value != null) {
        _stateSubject.add(initDetailsState(value));
      }else {
        _stateSubject.add(ErrorState('Error'));
      }
    });
  }
}