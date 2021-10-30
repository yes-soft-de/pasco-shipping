import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_proxies/response/proxies_response.dart';
import 'package:pasco_shipping/module_proxies/service/proixes_service.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipemnt_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/request/shipment_filter_finance_request.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/service/finance_shipment_service.dart';
import 'package:pasco_shipping/module_shipments_orders_accepted/ui/state/accepted_shipment_finance_state/shipment_finance_state.dart';
import 'package:pasco_shipping/module_sub_contract/response/subcontract_response.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AcceptedShipmentsFinanceStateManager {
  final FinanceShipmentService _service;
  final SubcontractService _subcontractService;
  final ProxyService _proxyService;

  final PublishSubject<FinanceShipmentsState> _stateSubject = PublishSubject();
  Stream<FinanceShipmentsState> get stateStream => _stateSubject.stream;

  AcceptedShipmentsFinanceStateManager(this._service, this._subcontractService, this._proxyService);
  //
  void getShipmentLCLFinance(ShipmentLCLFilterFinanceRequest request) {
    _stateSubject.add(LoadingState());
    _service.getShipmentLCLFinance(request).then((value) {
      print(value);
      if (value != null) {
        _subcontractService.getSubcontracts().then((subcontracts) {
          if(subcontracts != null){
            _stateSubject.add(SuccessfullyFetchState(value,subcontracts,[]));
          }
        });
      } else {
        _stateSubject.add(ErrorState('Error', false));
      }
    });
  }

  void addShipmentFinance(ShipmentLCLFinanceRequest financeRequest,List<SubcontractModel> subs ,List<ProxyModel> proxies) {
    _stateSubject.add(LoadingState());
    _service.createShipmentFinance(financeRequest).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          ShipmentLCLFilterFinanceRequest request = ShipmentLCLFilterFinanceRequest(shipmentID: financeRequest.shipmentID ,trackNumber:  financeRequest.trackNumber);
          _service
              .getShipmentLCLFinance(request)
              .then((finances) {
            if (finances != null) {
              _stateSubject.add(SuccessfullyFetchState(finances,subs,proxies));
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
