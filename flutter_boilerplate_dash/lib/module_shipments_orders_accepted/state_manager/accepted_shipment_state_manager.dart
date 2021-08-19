import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/service/accepted_shipment_service.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_state/accepted_shipment_state.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AcceptedShipmentsStateManager {
  final AcceptedShipmentService _service;

  final PublishSubject<AcceptedShipmentsState> _stateSubject = PublishSubject();
  Stream<AcceptedShipmentsState> get stateStream => _stateSubject.stream;

  AcceptedShipmentsStateManager(this._service);

  void getAcceptedShipment(AcceptedShipmentFilterRequest type) {
    _stateSubject.add(LoadingState());
    _service.getAcceptedShipment(type).then((value) {
      print(value);
      if (value != null && value.isNotEmpty) {
        _stateSubject.add(SuccessfullyFetchState(value));
      } else if(value !=null  && value.isEmpty) {
        _stateSubject.add(ErrorState('No Data' , true));
      }else {
        _stateSubject.add(ErrorState('Error' , false));
      }
    });
  }
}