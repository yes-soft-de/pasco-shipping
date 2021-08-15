import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipemnt_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/service/accepted_shipment_service.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_finance_state/shipment_finance_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AcceptedShipmentsFinanceStateManager {
  final AcceptedShipmentService _service;

  final PublishSubject<FinanceShipmentsState> _stateSubject = PublishSubject();
  Stream<FinanceShipmentsState> get stateStream => _stateSubject.stream;

  AcceptedShipmentsFinanceStateManager(this._service);
  //
  void getShipmentFinance(String id, String trackNumber) {
    _stateSubject.add(LoadingState());
    _service.getShipmentFinance(id, trackNumber).then((value) {
      print(value);
      if (value != null) {
        _stateSubject.add(SuccessfullyFetchState(value));
      } else {
        _stateSubject.add(ErrorState('Error', false));
      }
    });
  }

  void addShipmentFinance(ShipmentFinanceRequest financeRequest) {
    _stateSubject.add(LoadingState());
    _service.createShipmentFinance(financeRequest).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _service
              .getShipmentFinance(financeRequest.shipmentID.toString(),
                  financeRequest.trackNumber)
              .then((finances) {
            if (finances != null) {
              _stateSubject.add(SuccessfullyFetchState(finances));
            } else {
              _stateSubject.add(ErrorState('Error', false));
            }
          });
        } else {
          _stateSubject.add(ErrorState('Error', false));
        }
      }
    });
  }
}
