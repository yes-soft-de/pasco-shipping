import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_my_shipment/service/my_shipment_service.dart';
import 'package:pasco_shipping/module_my_shipment/ui/state/my_shipment_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class MyShipmentStateManger {
  final MyShipmentService _myShipmentService;
  final PublishSubject<MyShipmentState> _stateSubject = PublishSubject();
  Stream<MyShipmentState> get stateStream => _stateSubject.stream;

  MyShipmentStateManger(this._myShipmentService);

  void getMyShipmentActive() {
    _stateSubject.add(LoadingMyShipmentState());

    _myShipmentService.getMyActiveShipment().then((shipments) {
      if (shipments == null) {
        _stateSubject.add(ErrorFetchingDataState('error connection'));
      } else {
        _stateSubject.add(SuccessfullyFetchActiveShipmentState(shipments));
      }
    });
  }
  void getMyShipmentHistory() {
    _stateSubject.add(LoadingMyShipmentState());

    _myShipmentService.getMyDeliveredShipment().then((shipments) {
      if (shipments == null) {
        _stateSubject.add(ErrorFetchingDataState('error connection'));
      } else {
        _stateSubject.add(SuccessfullyFetchHistoryShipmentState(shipments));
      }
    });
  }
}
