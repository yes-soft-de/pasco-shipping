import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/consts/subcontarct_service.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_request.dart';
import 'package:pasco_shipping/module_airwaybill/service/airwaybill_service.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_airwaybill_specification/service/airwaybill_specification_service.dart';
import 'package:pasco_shipping/module_client/service/client_service.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_filter_request.dart';
import 'package:pasco_shipping/module_harbor/service/harbor_service.dart';
import 'package:pasco_shipping/module_shipment_request/service/shipment_request_service/first_option_service.dart';
import 'package:pasco_shipping/module_shipper/service/shipper_service.dart';
import 'package:pasco_shipping/module_sub_contract/request/subcontract_fliter_request.dart';
import 'package:pasco_shipping/module_sub_contract/service/subcontract_service.dart';
import 'package:pasco_shipping/module_subcontract_services/service/sub_contract_service.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class AddAirwaybillStateManager {
  final AirwaybillService _service;
  final SubcontractService _subcontractService;
  // final AirwaybillSpecificationService _containerSpecificationService;
  final ClientService _clientService;
  final HarborService _harborService;
  final ShipperService _shipperService;
  final FirstOptionService _firstOptionService;
  final PublishSubject<AddAirwaybillState> _addStateSubject = PublishSubject();
  Stream<AddAirwaybillState> get stateStream => _addStateSubject.stream;

  AddAirwaybillStateManager(
      this._service,this._subcontractService , this._clientService, this._harborService,this._shipperService, this._firstOptionService);

  void requestAirwaybill(AirwaybillRequest request) {
    _addStateSubject.add(LoadingAddState());
    _service.requestAirwaybill(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _addStateSubject.add(SuccessfullyAddState(value));
        } else {
          _addStateSubject.add(ErrorAddState('error'));
        }
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }

  void getSubContractAndHarborAndCountries() {
    _addStateSubject.add(LoadingAddState());
    FilterSubcontractRequest requestSub =FilterSubcontractRequest(serviceName: Service.Carrier);
    _subcontractService.getSubcontracts(requestSub).then((subs) {
          if (subs != null) {
            _clientService.getClients().then((clients) {
              if(clients != null){
                HarborFilterRequest request =HarborFilterRequest(type: 'airport');
                _harborService.getHarbor(request).then((harbors) {
                  if(harbors != null){
                    _firstOptionService.getWarehouse().then((countries) {
                      if(countries != null) {
                        _addStateSubject
                          .add(InitAddState(subcontracts: subs ,clients: clients,harbors: harbors,shippers: [],countries: countries));
                      }
                    });
                  }
                });
              }else {
                _addStateSubject.add(ErrorAddState('error'));
              }
            });
          } else {
            _addStateSubject.add(ErrorAddState('error'));
          }
        });
  }
  void getSubContractAndShipper() {
    _addStateSubject.add(LoadingAddState());
    FilterSubcontractRequest request =FilterSubcontractRequest();
    _subcontractService.getSubcontracts(request).then((subs) {
          if (subs != null) {
            _clientService.getClients().then((clients) {
              if(clients != null){
                _shipperService.getShippers().then((shippers) {
                  if(shippers != null){
                    _addStateSubject
                        .add(InitAddState(subcontracts: subs ,clients: clients,harbors: [],shippers: shippers,countries: []));
                  }
                });
              }else {
                _addStateSubject.add(ErrorAddState('error'));
              }
            });
          } else {
            _addStateSubject.add(ErrorAddState('error'));
          }
        });
  }

  void updateAirwaybill(AirwaybillRequest request) {
    _addStateSubject.add(LoadingAddState());
    _service.updateAirwaybill(request).then((value) {
      if (value != null) {
        if (value.isConfirmed) {
          _addStateSubject.add(SuccessfullyAddState(value));
        } else {
          _addStateSubject.add(ErrorAddState('error'));
        }
      } else {
        _addStateSubject.add(ErrorAddState('error'));
      }
    });
  }
}
