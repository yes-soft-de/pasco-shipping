import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/service/accepted_shipment_service.dart';

@injectable
class AcceptedShipmentsFinanceStateManager {
  final AcceptedShipmentService _service;

  // final PublishSubject<AcceptedShipmentsState> _stateSubject = PublishSubject();
  // Stream<AcceptedShipmentsState> get stateStream => _stateSubject.stream;
  //
  AcceptedShipmentsFinanceStateManager(this._service);
  //
  // void getAcceptedShipment(AcceptedShipmentFilterRequest type) {
  //   _stateSubject.add(LoadingState());
  //   _service.getAcceptedShipment(type).then((value) {
  //     print(value);
  //     if (value != null && value.isNotEmpty) {
  //       _stateSubject.add(SuccessfullyFetchState(value));
  //     } else if(value!.isEmpty) {
  //       _stateSubject.add(ErrorState('No Data' , true));
  //     }else {
  //       _stateSubject.add(ErrorState('Error' , false));
  //     }
  //   });
  // }
}