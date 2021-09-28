import 'package:injectable/injectable.dart';
import 'package:pasco_shipping/module_airwaybill/request/airwaybill_request.dart';
import 'package:pasco_shipping/module_airwaybill/service/airwaybill_service.dart';
import 'package:pasco_shipping/module_airwaybill/ui/state/addnew_state/add_state.dart';
import 'package:pasco_shipping/module_airwaybill_specification/service/airwaybill_specification_service.dart';
import 'package:pasco_shipping/module_client/service/client_service.dart';
import 'package:pasco_shipping/module_harbor/request/harbor_filter_request.dart';
import 'package:pasco_shipping/module_harbor/service/harbor_service.dart';
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

  final PublishSubject<AddAirwaybillState> _addStateSubject = PublishSubject();
  Stream<AddAirwaybillState> get stateStream => _addStateSubject.stream;

  AddAirwaybillStateManager(
      this._service,this._subcontractService , this._clientService, this._harborService);

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

  void getSubContractAndSpecificationAndHarbor() {
    _addStateSubject.add(LoadingAddState());
        _subcontractService.getSubcontracts().then((subs) {
          if (subs != null) {
            _clientService.getClients().then((clients) {
              if(clients != null){
                HarborFilterRequest request =HarborFilterRequest(type: 'airport');
                _harborService.getHarbor(request).then((harbors) {
                  if(harbors != null){
                    _addStateSubject
                        .add(InitAddState(subcontracts: subs ,clients: clients,harbors: harbors));
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